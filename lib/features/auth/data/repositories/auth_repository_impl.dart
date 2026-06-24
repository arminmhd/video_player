import 'package:movie_stream_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:movie_stream_app/features/auth/data/datasources/auth_remote_datasource.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    final user = await remoteDataSource.signIn(
      email: email,
      password: password,
    );

    await _cacheToken();

    return user;
  }

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final user = await remoteDataSource.signUp(
      email: email,
      password: password,
      name: name,
    );

    await _cacheToken();

    return user;
  }

  @override
  Future<UserEntity> signInWithGoogle() async {
    final user = await remoteDataSource.signInWithGoogle();

    await _cacheToken();

    return user;
  }

  Future<void> _cacheToken() async {
    final token = await remoteDataSource.getIdToken();

    if (token != null && token.isNotEmpty) {
      await localDataSource.saveToken(token);
    }
  }

  @override
  Future<void> signOut() async {
    await remoteDataSource.signOut();
    await localDataSource.deleteToken();
  }

  @override
  @override
  Future<bool> isLoggedIn() async {
    final token = await localDataSource.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<UserEntity?> currentUser() async {
    final token = await localDataSource.getToken();

    if (token == null || token.isEmpty) return null;

    return remoteDataSource.currentUser();
  }
}

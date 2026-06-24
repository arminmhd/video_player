import 'package:movie_stream_app/features/auth/domain/entities/user_entity.dart';
import 'package:movie_stream_app/features/auth/domain/repositories/auth_repository.dart';

class GoogleSignInUseCase {
  final AuthRepository repository;
  GoogleSignInUseCase(this.repository);
  Future<UserEntity> call() {
    return repository.signInWithGoogle();
  }
}

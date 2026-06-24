import '../entities/user_entity.dart';

abstract interface class AuthRepository {
  Future<UserEntity> signIn({required String email, required String password});

  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<UserEntity> signInWithGoogle();

  Future<void> signOut();

  Future<bool> isLoggedIn();

  Future<UserEntity?> currentUser();
}

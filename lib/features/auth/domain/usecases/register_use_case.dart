import 'package:movie_stream_app/core/usecases/usecase.dart';
import 'package:movie_stream_app/features/auth/domain/entities/user_entity.dart';
import 'package:movie_stream_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/auth_params.dart';

class SignUpUseCase implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<UserEntity> call(SignUpParams params) {
    return repository.signUp(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

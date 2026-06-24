import 'package:movie_stream_app/features/auth/domain/usecases/auth_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase implements UseCase<UserEntity, SignInParams> {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<UserEntity> call(SignInParams params) {
    return repository.signIn(email: params.email, password: params.password);
  }
}

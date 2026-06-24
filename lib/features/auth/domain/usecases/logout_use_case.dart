import 'package:movie_stream_app/core/usecases/no_params.dart';
import 'package:movie_stream_app/core/usecases/usecase.dart';
import 'package:movie_stream_app/features/auth/domain/repositories/auth_repository.dart';

class SignOutUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  @override
  Future<void> call(NoParams params) {
    return repository.signOut();
  }
}

import 'package:movie_stream_app/core/usecases/no_params.dart';
import 'package:movie_stream_app/core/usecases/usecase.dart';
import 'package:movie_stream_app/features/auth/domain/repositories/auth_repository.dart';

class CheckAuthUseCase implements UseCase<bool, NoParams> {
  final AuthRepository repository;

  CheckAuthUseCase(this.repository);

  @override
  Future<bool> call(NoParams params) {
    return repository.isLoggedIn();
  }
}

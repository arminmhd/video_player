import 'package:movie_stream_app/core/usecases/no_params.dart';
import 'package:movie_stream_app/core/usecases/usecase.dart';
import 'package:movie_stream_app/features/auth/domain/entities/user_entity.dart';
import 'package:movie_stream_app/features/auth/domain/repositories/auth_repository.dart';

class CurrentUserUseCase implements UseCase<UserEntity?, NoParams> {
  final AuthRepository repository;

  CurrentUserUseCase(this.repository);

  @override
  Future<UserEntity?> call(NoParams params) {
    return repository.currentUser();
  }
}

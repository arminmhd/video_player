import 'package:movie_stream_app/features/home/domain/entities/movie_entity.dart';
import 'package:movie_stream_app/features/home/domain/repository/home_repository.dart';

class GetPopularMoviesUseCase {
  final HomeRepository repository;

  GetPopularMoviesUseCase(this.repository);

  Future<List<MovieEntity>> call() {
    return repository.getPopularMovies();
  }
}

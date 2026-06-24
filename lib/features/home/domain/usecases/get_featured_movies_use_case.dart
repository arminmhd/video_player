import 'package:movie_stream_app/features/home/domain/entities/movie_entity.dart';
import 'package:movie_stream_app/features/home/domain/repository/home_repository.dart';

class GetFeaturedMoviesUseCase {
  final HomeRepository repository;

  GetFeaturedMoviesUseCase(this.repository);

  Future<List<MovieEntity>> call() {
    return repository.getNowPlayingMovies();
  }
}

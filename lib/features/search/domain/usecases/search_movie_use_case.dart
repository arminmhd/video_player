import 'package:movie_stream_app/features/home/domain/entities/movie_entity.dart';
import 'package:movie_stream_app/features/search/domain/repository/search_repository.dart';

class SearchMovieUseCase {
  final SearchRepository repository;
  SearchMovieUseCase(this.repository);

  Future<List<MovieEntity>> call(String query) {
    return repository.searchMovies(query);
  }
}

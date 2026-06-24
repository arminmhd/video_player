import 'package:movie_stream_app/features/home/domain/entities/movie_entity.dart';
import 'package:movie_stream_app/features/search/domain/repository/search_repository.dart';

class SearchTvShowsUseCase {
  final SearchRepository repository;

  SearchTvShowsUseCase(this.repository);

  Future<List<MovieEntity>> call(String query) {
    return repository.searchTvShows(query);
  }
}

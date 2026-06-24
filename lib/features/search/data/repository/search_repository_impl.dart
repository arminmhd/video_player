import 'package:movie_stream_app/features/home/domain/entities/movie_entity.dart';
import 'package:movie_stream_app/features/search/data/datasource/search_remote_data_source.dart';
import 'package:movie_stream_app/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieEntity>> searchMovies(String query) {
    return remoteDataSource.searchMovies(query);
  }

  @override
  Future<List<MovieEntity>> searchTvShows(String query) {
    return remoteDataSource.searchTvShows(query);
  }

  @override
  Future<List<MovieEntity>> searchMulti(String query) {
    return remoteDataSource.searchMulti(query);
  }
}

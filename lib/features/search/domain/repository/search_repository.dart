import 'package:movie_stream_app/features/home/domain/entities/movie_entity.dart';

abstract interface class SearchRepository {
  Future<List<MovieEntity>> searchMovies(String query);
  Future<List<MovieEntity>> searchMulti(String query);
  Future<List<MovieEntity>> searchTvShows(String query);
}

import 'package:movie_stream_app/features/home/data/models/movie_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<MovieModel>> searchMulti(String query);
  Future<List<MovieModel>> searchMovies(String query);
  Future<List<MovieModel>> searchTvShows(String query);
}

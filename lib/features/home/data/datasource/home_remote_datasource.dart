import '../models/movie_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getNowPlayingMovies();
}

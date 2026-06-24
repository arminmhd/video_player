import 'package:movie_stream_app/features/home/domain/entities/movie_entity.dart';

abstract interface class HomeRepository {
  Future<List<MovieEntity>> getTrendingMovies();
  Future<List<MovieEntity>> getPopularMovies();
  Future<List<MovieEntity>> getNowPlayingMovies();
}

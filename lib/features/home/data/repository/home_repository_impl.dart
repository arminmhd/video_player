import 'package:movie_stream_app/features/home/data/datasource/home_remote_datasource.dart';
import 'package:movie_stream_app/features/home/domain/entities/movie_entity.dart';
import 'package:movie_stream_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieEntity>> getNowPlayingMovies() {
    return remoteDataSource.getTrendingMovies();
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() {
    return remoteDataSource.getPopularMovies();
  }

  @override
  Future<List<MovieEntity>> getTrendingMovies() {
    return remoteDataSource.getTrendingMovies();
  }
}

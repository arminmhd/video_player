import 'package:movie_stream_app/features/movie_detail/data/datatsource/movie_detail_remote_data_source.dart';
import 'package:movie_stream_app/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:movie_stream_app/features/movie_detail/domain/repository/movie_detail_repository.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  final MovieDetailRemoteDataSource remoteDataSource;
  MovieDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<MovieDetailEntity> getMovieDetail(int movieId) {
    return remoteDataSource.getMovieDetail(movieId);
  }
}

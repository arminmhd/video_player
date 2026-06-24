import 'package:movie_stream_app/features/movie_detail/domain/entities/movie_detail_entity.dart';

abstract interface class MovieDetailRepository {
  Future<MovieDetailEntity> getMovieDetail(int movieId);
}

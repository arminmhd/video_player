import 'package:movie_stream_app/features/movie_detail/data/model/movie_detail_model.dart';

abstract class MovieDetailRemoteDataSource {
  Future<MovieDetailModel> getMovieDetail(int movieId);
}

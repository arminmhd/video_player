import 'package:movie_stream_app/core/network/api_endpoint.dart';
import 'package:movie_stream_app/core/network/dio_client.dart';
import 'package:movie_stream_app/features/movie_detail/data/datatsource/movie_detail_remote_data_source.dart';
import 'package:movie_stream_app/features/movie_detail/data/model/movie_detail_model.dart';

class MovieDetailRemoteDataSourceImpl implements MovieDetailRemoteDataSource {
  final DioClient client;
  MovieDetailRemoteDataSourceImpl(this.client);
  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final response = await client.dio.get(ApiEndpoint.movieDetail(movieId));

    return MovieDetailModel.fromJson(response.data);
  }
}

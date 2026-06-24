import 'package:movie_stream_app/core/network/api_endpoint.dart';
import 'package:movie_stream_app/core/network/dio_client.dart';
import 'package:movie_stream_app/features/home/data/datasource/home_remote_datasource.dart';
import 'package:movie_stream_app/features/home/data/models/movie_model.dart';

class HomeRemoteDatasourceImpl implements HomeRemoteDataSource {
  final DioClient dioClient;

  HomeRemoteDatasourceImpl(this.dioClient);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await dioClient.dio.get(ApiEndpoint.nowPlayingMovies);
    return (response.data['results'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await dioClient.dio.get(ApiEndpoint.popularMovies);
    return (response.data['results'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await dioClient.dio.get(ApiEndpoint.trendingMovies);
    return (response.data['results'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();
  }
}

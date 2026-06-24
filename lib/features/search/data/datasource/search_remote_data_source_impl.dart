import 'package:movie_stream_app/core/network/api_endpoint.dart';
import 'package:movie_stream_app/core/network/dio_client.dart';
import 'package:movie_stream_app/features/home/data/models/movie_model.dart';
import 'package:movie_stream_app/features/search/data/datasource/search_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final DioClient client;

  SearchRemoteDataSourceImpl(this.client);

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client.dio.get(
      ApiEndpoint.searchMovies,
      queryParameters: {'query': query, 'language': 'en-US', 'page': 1},
    );

    final result = response.data['results'] as List;

    return result.map((e) => MovieModel.fromJson(e)).toList();
  }

  @override
  Future<List<MovieModel>> searchTvShows(String query) async {
    final response = await client.dio.get(
      ApiEndpoint.searchTvShows,
      queryParameters: {'query': query, 'language': 'en-US', 'page': 1},
    );

    final result = response.data['results'] as List;

    return result.map((e) => MovieModel.fromJson(e)).toList();
  }

  @override
  Future<List<MovieModel>> searchMulti(String query) async {
    final response = await client.dio.get(
      ApiEndpoint.searchMulti,
      queryParameters: {'query': query, 'language': 'en-US', 'page': 1},
    );

    final result = response.data['results'] as List;

    return result.map((e) => MovieModel.fromJson(e)).toList();
  }
}

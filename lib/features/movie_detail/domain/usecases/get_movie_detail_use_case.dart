import 'package:movie_stream_app/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:movie_stream_app/features/movie_detail/domain/repository/movie_detail_repository.dart';

class GetMovieDetailUseCase {
  final MovieDetailRepository repository;
  GetMovieDetailUseCase(this.repository);

  Future<MovieDetailEntity> call(int movieId) {
    return repository.getMovieDetail(movieId);
  }
}

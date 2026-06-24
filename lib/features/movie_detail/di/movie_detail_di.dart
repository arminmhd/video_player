import 'package:get_it/get_it.dart';
import 'package:movie_stream_app/features/movie_detail/data/datatsource/movie_detail_remote_data_source.dart';
import 'package:movie_stream_app/features/movie_detail/data/datatsource/movie_detail_remote_data_source_impl.dart';
import 'package:movie_stream_app/features/movie_detail/data/repository/movie_detail_repository_impl.dart';
import 'package:movie_stream_app/features/movie_detail/domain/repository/movie_detail_repository.dart';
import 'package:movie_stream_app/features/movie_detail/domain/usecases/get_movie_detail_use_case.dart';
import 'package:movie_stream_app/features/movie_detail/presentation/bloc/movie_detail_bloc.dart';

final sl = GetIt.instance;

Future initMovieDetailDependencies() async {
  sl.registerLazySingleton<MovieDetailRemoteDataSource>(
    () => MovieDetailRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<MovieDetailRepository>(
    () => MovieDetailRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));

  sl.registerFactory(() => MovieDetailBloc(getMovieDetail: sl()));
}

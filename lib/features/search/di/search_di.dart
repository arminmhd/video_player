import 'package:get_it/get_it.dart';
import 'package:movie_stream_app/features/search/data/datasource/search_remote_data_source.dart';
import 'package:movie_stream_app/features/search/data/datasource/search_remote_data_source_impl.dart';
import 'package:movie_stream_app/features/search/data/repository/search_repository_impl.dart';
import 'package:movie_stream_app/features/search/domain/repository/search_repository.dart';
import 'package:movie_stream_app/features/search/domain/usecases/search_movie_use_case.dart';
import 'package:movie_stream_app/features/search/domain/usecases/search_multi_use_case.dart';
import 'package:movie_stream_app/features/search/domain/usecases/search_tv_shows_use_case.dart';
import 'package:movie_stream_app/features/search/presentation/bloc/search_bloc.dart';

final sl = GetIt.instance;

Future initSearchDependencies() async {
  sl.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(sl()));

  sl.registerLazySingleton(() => SearchMovieUseCase(sl()));
  sl.registerLazySingleton(() => SearchMultiUseCase(sl()));
  sl.registerLazySingleton(() => SearchTvShowsUseCase(sl()));

  sl.registerFactory(() => SearchBloc(searchMovies: sl(), searchTv: sl()));
}

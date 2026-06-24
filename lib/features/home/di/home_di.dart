import 'package:get_it/get_it.dart';
import 'package:movie_stream_app/features/home/data/datasource/home_remote_datasource.dart';
import 'package:movie_stream_app/features/home/data/datasource/home_remote_datasource_impl.dart';
import 'package:movie_stream_app/features/home/data/repository/home_repository_impl.dart';
import 'package:movie_stream_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_stream_app/features/home/domain/usecases/get_featured_movies_use_case.dart';
import 'package:movie_stream_app/features/home/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_stream_app/features/home/domain/usecases/get_trending_movies_use_case.dart';
import 'package:movie_stream_app/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initHomeDependencies() async {
  //datasource
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDatasourceImpl(sl()),
  );

  //repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));

  //use case

  sl.registerLazySingleton(() => GetTrendingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetFeaturedMoviesUseCase(sl()));

  //home bloc

  sl.registerFactory(
    () => HomeBloc(
      getFeaturedMovies: sl(),
      getTrendingMovies: sl(),
      getPopularMovies: sl(),
    ),
  );
}

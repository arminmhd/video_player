import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_stream_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:movie_stream_app/features/auth/data/datasources/auth_local_datasource_imple.dart';
import 'package:movie_stream_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:movie_stream_app/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/check_auth_use_case.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/current_user_use_case.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/google_sign_in_use_case.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/logout_use_case.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/register_use_case.dart';
import 'package:movie_stream_app/features/auth/presentation/bloc/auth_bloc.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';

final sl = GetIt.instance;

Future<void> initAuthDependencies() async {
  // DataSource
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<FirebaseAuth>(), sl<GoogleSignIn>()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      sl<AuthRemoteDataSource>(),
      sl<AuthLocalDataSource>(),
    ),
  );

  // UseCases
  sl.registerLazySingleton(() => SignInUseCase(sl()));

  sl.registerLazySingleton(() => SignUpUseCase(sl()));

  sl.registerLazySingleton(() => SignOutUseCase(sl()));

  sl.registerLazySingleton(() => CheckAuthUseCase(sl()));

  sl.registerLazySingleton(() => CurrentUserUseCase(sl()));

  sl.registerLazySingleton(() => GoogleSignInUseCase(sl()));

  //auth bloc
  sl.registerFactory(
    () => AuthBloc(
      signIn: sl(),
      signUp: sl(),
      signOut: sl(),
      checkAuth: sl(),
      currentUser: sl(),
      googleSignIn: sl(),
    ),
  );
}

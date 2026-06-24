import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_stream_app/app/di/injection.dart';
import 'package:movie_stream_app/core/network/dio_client.dart';
import 'package:movie_stream_app/core/services/firebase_service.dart';
import 'package:movie_stream_app/core/services/secure_storage_service.dart';

Future<void> initCore() async {
  sl.registerLazySingleton(() => DioClient());

  sl.registerLazySingleton(() => FirebaseAuth.instance);

  sl.registerLazySingleton(() => FlutterSecureStorage());

  sl.registerLazySingleton(() => SecureStorageService(sl()));

  sl.registerLazySingleton(() => FirebaseService(sl()));

  sl.registerLazySingleton(() => GoogleSignIn());
}

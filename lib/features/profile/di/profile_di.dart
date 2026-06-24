import 'package:movie_stream_app/features/navigation/di/navigation_di.dart';
import 'package:movie_stream_app/features/profile/presentation/bloc/profile_bloc.dart';

Future initProfileDependencies() async {
  sl.registerFactory(() => ProfileBloc(getCurrentUser: sl()));
}

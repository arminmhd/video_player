import 'package:get_it/get_it.dart';
import 'package:movie_stream_app/features/video_player/presentation/bloc/player_bloc.dart';

final sl = GetIt.instance;

Future<void> initPlayerDependencies() async {
  // Bloc
  sl.registerFactory(() => PlayerBloc());
}

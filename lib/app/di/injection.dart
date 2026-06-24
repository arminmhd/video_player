import 'package:get_it/get_it.dart';
import 'package:movie_stream_app/app/di/core_di.dart';
import 'package:movie_stream_app/features/auth/di/auth_di.dart';
import 'package:movie_stream_app/features/home/di/home_di.dart';
import 'package:movie_stream_app/features/movie_detail/di/movie_detail_di.dart';
import 'package:movie_stream_app/features/navigation/di/navigation_di.dart';
import 'package:movie_stream_app/features/profile/di/profile_di.dart';
import 'package:movie_stream_app/features/search/di/search_di.dart';
import 'package:movie_stream_app/features/video_player/di/player_di.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  await initCore();

  await initAuthDependencies();

  await initHomeDependencies();

  await initNavigationDependencies();

  await initSearchDependencies();

  await initMovieDetailDependencies();

  await initPlayerDependencies();

  await initProfileDependencies();
}

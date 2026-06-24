import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_stream_app/app/di/injection.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/get_started/get_started_page.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/sign_up/sign_up_page.dart';
import 'package:movie_stream_app/features/explore/presentation/pages/explore_page.dart';
import 'package:movie_stream_app/features/home/presentation/pages/home_page.dart';
import 'package:movie_stream_app/features/movie_detail/presentation/pages/movie_detail_page.dart';
import 'package:movie_stream_app/features/navigation/presentation/pages/main_page.dart';
import 'package:movie_stream_app/features/search/presentation/pages/search_page.dart';
import 'package:movie_stream_app/features/video_player/presentation/bloc/player_bloc.dart';
import 'package:movie_stream_app/features/video_player/presentation/pages/player_page.dart';

import 'route_names.dart';

abstract final class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.splash,

    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const SignInPage(),
      ),

      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const SignUpPage(),
      ),

      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.main,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: AppRoutes.explore,
        builder: (context, state) => const ExplorePage(),
      ),

      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const SearchPage(),
      ),

      GoRoute(
        path: AppRoutes.movieDetail,
        builder: (context, state) {
          final movieId = int.parse(state.pathParameters['id']!);
          return MovieDetailPage(movieId: movieId);
        },
      ),

      GoRoute(
        path: AppRoutes.player,
        builder: (context, state) {
          final url = state.extra as String;
          return BlocProvider(
            create: (_) => sl<PlayerBloc>(),
            child: PlayerPage(url: url),
          );
        },
      ),
    ],
  );
}

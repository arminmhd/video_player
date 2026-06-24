import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/app/di/injection.dart';
import 'package:movie_stream_app/app/router/app_router.dart';
import 'package:movie_stream_app/core/theme/app_theme.dart';
import 'package:movie_stream_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movie_stream_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:movie_stream_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_stream_app/features/home/presentation/bloc/home_event.dart';
import 'package:movie_stream_app/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:movie_stream_app/features/search/presentation/bloc/search_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<AuthBloc>()..add(AuthCheckRequested()),
            ),

            BlocProvider(
              create: (context) => sl<HomeBloc>()..add(HomeStarted()),
            ),

            BlocProvider(create: (context) => sl<NavigationBloc>()),

            BlocProvider(create: (context) => sl<SearchBloc>()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}

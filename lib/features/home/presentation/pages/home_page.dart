import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_stream_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_stream_app/features/home/presentation/bloc/home_state.dart';
import 'package:movie_stream_app/features/home/presentation/pages/home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.status == HomeStatus.error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message ?? 'Error')));
        }
      },
      builder: (context, state) {
        return HomeView(
          state: state,
          onMovieTap: (id) {
            context.push('/movie/$id');
          },
        );
      },
    );
  }
}

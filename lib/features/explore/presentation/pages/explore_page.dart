import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_stream_app/features/explore/presentation/pages/explore_view.dart';
import 'package:movie_stream_app/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:movie_stream_app/features/navigation/presentation/bloc/navigation_event.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ExploreView(
      searchIconPressed: () {
        context.read<NavigationBloc>().add(SearchOpened());
      },
    );
  }
}

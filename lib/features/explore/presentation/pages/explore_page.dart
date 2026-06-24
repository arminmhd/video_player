import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_stream_app/features/explore/presentation/pages/explore_view.dart';
import 'package:movie_stream_app/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:movie_stream_app/features/navigation/presentation/bloc/navigation_event.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return ExploreView(
      searchIconPressed: () {
        context.read<NavigationBloc>().add(SearchOpened());
      },
    );
  }
}

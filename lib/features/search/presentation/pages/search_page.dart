import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_stream_app/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:movie_stream_app/features/navigation/presentation/bloc/navigation_event.dart';
import 'package:movie_stream_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:movie_stream_app/features/search/presentation/bloc/search_evet.dart';
import 'package:movie_stream_app/features/search/presentation/bloc/search_state.dart';
import 'package:movie_stream_app/features/search/presentation/pages/search_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state.status == SearchStatus.error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message ?? 'Error')));
        }
      },
      child: SearchView(
        onValueChanged: (value) {
          context.read<SearchBloc>().add(SearchQueryChanged(value));
        },
        onBackPressed: () {
          context.read<NavigationBloc>().add(SearchClosed());
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_stream_app/core/theme/app_colors.dart';
import 'package:movie_stream_app/core/utils/get_network_image.dart';
import 'package:movie_stream_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:movie_stream_app/features/search/presentation/bloc/search_state.dart';

class SearchTvShowsTab extends StatelessWidget {
  final void Function(int movieId) onMovieTap;
  const SearchTvShowsTab({super.key, required this.onMovieTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        // loading
        if (state.status == SearchStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        // before search
        if (state.query.isEmpty) {
          return const Center(child: Text('Search for TV Shows'));
        }

        // empty result
        if (state.tvResults.isEmpty) {
          return const Center(child: Text('No TV Shows Found'));
        }

        return GridView.builder(
          padding: const EdgeInsets.only(top: 16),
          itemCount: state.tvResults.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            final tv = state.tvResults[index];

            return InkWell(
              onTap: () => onMovieTap(tv.id),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        getPosterUrl(tv.posterPath),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.transparent,
                            width: double.infinity,
                            child: Icon(
                              Icons.image_not_supported,
                              color: AppColors.textMuted,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(tv.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_stream_app/core/theme/app_text_styles.dart';

class ExploreAppBar extends StatelessWidget {
  final VoidCallback? onPressed;
  const ExploreAppBar({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Explore', style: AppTextStyles.titleMedium),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.search),
          tooltip: 'Search',
        ),
      ],
    );
  }
}

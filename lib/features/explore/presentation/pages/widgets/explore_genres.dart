import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/theme/app_colors.dart';
import 'package:movie_stream_app/core/theme/app_text_styles.dart';

class ExploreGenres extends StatelessWidget {
  final List<String> genres = const [
    "Action",
    "Adventure",
    "Animation",
    "Comedy",
    "Crime",
    "Documantary",
    "Drama",
    "Fantasty",
    "Horror",
    "Mystery",
    "Romance",
    "Sci-Fi",
    "Thriller",
    "War",
    "Western",
  ];
  const ExploreGenres({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text('Genres', style: AppTextStyles.titleMedium),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: genres.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.2,
          ),
          itemBuilder: (context, index) {
            return _buildButton(() {}, Text(genres[index]));
          },
        ),
      ],
    );
  }
}

Widget _buildButton(VoidCallback? onPressed, Widget child) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      foregroundColor: AppColors.textPrimary,
      backgroundColor: AppColors.card,
      padding: EdgeInsets.all(15.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    ),
    child: child,
  );
}

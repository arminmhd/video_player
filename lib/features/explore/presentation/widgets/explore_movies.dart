import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/theme/app_colors.dart';

class ExploreMovies extends StatelessWidget {
  final ValueChanged<String>? onCategorySelected;

  const ExploreMovies({super.key, this.onCategorySelected});

  static const List<String> categories = ['Movies', 'TV Shows', 'Genres'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories.map((category) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: _CategoryButton(
                title: category,
                onPressed: () => onCategorySelected?.call(category),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const _CategoryButton({required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        backgroundColor: AppColors.card,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(title, textAlign: TextAlign.center),
    );
  }
}

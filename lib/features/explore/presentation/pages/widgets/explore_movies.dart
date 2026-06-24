import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/theme/app_colors.dart';

class ExploreMovies extends StatelessWidget {
  const ExploreMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildButton(() {}, Text('Movies')),
          _buildButton(() {}, Text('TV Shows')),
          _buildButton(() {}, Text('Genres')),
        ],
      ),
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

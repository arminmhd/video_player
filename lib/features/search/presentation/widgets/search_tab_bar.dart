import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/theme/app_colors.dart';
import 'package:movie_stream_app/core/theme/app_text_styles.dart';

class SearchTabBar extends StatelessWidget {
  const SearchTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: AppColors.card,
      dividerHeight: 1,
      indicatorColor: AppColors.primary,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: .2,
      labelStyle: AppTextStyles.bodyLarge.copyWith(color: AppColors.primary),
      labelPadding: EdgeInsets.symmetric(vertical: 8.h),
      unselectedLabelColor: AppColors.textMuted,
      tabs: [
        Tab(text: 'All'),
        Tab(text: 'Movies'),
        Tab(text: 'TV Shows'),
      ],
    );
  }
}

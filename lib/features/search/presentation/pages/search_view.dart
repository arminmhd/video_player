import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/features/search/presentation/widgets/search_all_tab.dart';
import 'package:movie_stream_app/features/search/presentation/widgets/search_app_bar.dart';
import 'package:movie_stream_app/features/search/presentation/widgets/search_movies_tab.dart';
import 'package:movie_stream_app/features/search/presentation/widgets/search_tab_bar.dart';
import 'package:movie_stream_app/features/search/presentation/widgets/search_tv_shows_tab.dart';

class SearchView extends StatelessWidget {
  final VoidCallback onBackPressed;
  final ValueChanged onValueChanged;
  const SearchView({
    super.key,
    required this.onBackPressed,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchAppBar(
                onBackPressed: onBackPressed,
                onValueChanged: onValueChanged,
              ),
              SizedBox(height: 12.h),
              SearchTabBar(),
              Expanded(
                child: TabBarView(
                  children: [
                    SearchAllTab(),
                    SearchMoviesTab(),
                    SearchTvShowsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

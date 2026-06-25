import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/explore_app_bar.dart';
import '../widgets/explore_genres.dart';
import '../widgets/explore_movies.dart';

class ExploreView extends StatelessWidget {
  final VoidCallback? searchIconPressed;

  const ExploreView({super.key, this.searchIconPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExploreAppBar(onPressed: searchIconPressed),

              SizedBox(height: 24.h),

              ExploreMovies(),

              SizedBox(height: 24.h),

              ExploreGenres(),
            ],
          ),
        ),
      ),
    );
  }
}

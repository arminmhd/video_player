import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/features/explore/presentation/pages/widgets/explore_app_bar.dart';
import 'package:movie_stream_app/features/explore/presentation/pages/widgets/explore_genres.dart';
import 'package:movie_stream_app/features/explore/presentation/pages/widgets/explore_movies.dart';

class ExploreView extends StatelessWidget {
  final VoidCallback? searchIconPressed;
  const ExploreView({super.key, this.searchIconPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 20.w),
        child: Column(
          children: [
            ExploreAppBar(onPressed: searchIconPressed),
            ExploreMovies(),
            ExploreGenres(),
          ],
        ),
      ),
    );
  }
}

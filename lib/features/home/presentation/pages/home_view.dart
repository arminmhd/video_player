import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/features/home/presentation/bloc/home_state.dart';
import 'package:movie_stream_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:movie_stream_app/features/home/presentation/widgets/home_featured_movie_carousel.dart';
import 'package:movie_stream_app/features/home/presentation/widgets/home_popular_movies_section.dart';
import 'package:movie_stream_app/features/home/presentation/widgets/home_search_bar.dart';
import 'package:movie_stream_app/features/home/presentation/widgets/home_trending_section.dart';

class HomeView extends StatelessWidget {
  final HomeState state;
  final void Function(int movieId) onMovieTap;

  const HomeView({super.key, required this.state, required this.onMovieTap});

  @override
  Widget build(BuildContext context) {
    if (state.status == HomeStatus.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            children: [
              HomeAppBar(),

              SizedBox(height: 10.h),

              HomeSearchBar(),

              SizedBox(height: 15.h),

              // FEATURED
              HomeFeaturedMovieCarousel(
                movies: state.featuredMovies,
                onMovieTap: onMovieTap,
              ),

              SizedBox(height: 15.h),

              // TRENDING
              TrendingSection(
                movies: state.trendingMovies,
                onMovieTap: onMovieTap,
              ),

              //popular
              PopularMoviesSection(
                movies: state.popularMovies,
                onMovieTap: onMovieTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

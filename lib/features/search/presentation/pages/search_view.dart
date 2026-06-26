import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/search_all_tab.dart';
import '../widgets/search_app_bar.dart';
import '../widgets/search_movies_tab.dart';
import '../widgets/search_tab_bar.dart';
import '../widgets/search_tv_shows_tab.dart';

class SearchView extends StatefulWidget {
  final VoidCallback onBackPressed;
  final ValueChanged onValueChanged;
  final void Function(int movieId) onMovieTap;
  const SearchView({
    super.key,
    required this.onBackPressed,
    required this.onValueChanged,
    required this.onMovieTap,
  });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                SearchAppBar(
                  controller: _controller,
                  onBackPressed: widget.onBackPressed,
                  onValueChanged: widget.onValueChanged,
                ),

                SizedBox(height: 12.h),

                const SearchTabBar(),

                Expanded(
                  child: TabBarView(
                    children: [
                      SearchAllTab(onMovieTap: widget.onMovieTap),
                      SearchMoviesTab(onMovieTap: widget.onMovieTap),
                      SearchTvShowsTab(onMovieTap: widget.onMovieTap),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_stream_app/core/widgets/app_text_field.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      prefixIcon: Icon(Icons.search),
      hintText: 'Search movies, Tv shows...',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/widgets/app_text_field.dart';

class SearchAppBar extends StatelessWidget {
  final VoidCallback? onBackPressed;
  final ValueChanged? onValueChanged;
  final TextEditingController controller;

  const SearchAppBar({
    super.key,
    this.onBackPressed,
    this.onValueChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onBackPressed,
          icon: const Icon(Icons.arrow_back),
        ),

        Expanded(
          child: SizedBox(
            height: 50.h,
            child: AppTextField(
              controller: controller,
              onChanged: onValueChanged,
              hintText: 'Search Movies...',
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }
}

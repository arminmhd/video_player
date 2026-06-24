import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/widgets/app_text_field.dart';

class SearchAppBar extends StatelessWidget {
  final VoidCallback? onBackPressed;
  final controller = TextEditingController();
  final ValueChanged? onValueChanged;
  SearchAppBar({super.key, this.onBackPressed, this.onValueChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: onBackPressed, icon: Icon(Icons.arrow_back)),
        Expanded(
          child: SizedBox(
            height: 50.h,
            child: AppTextField(
              onChanged: onValueChanged,
              controller: controller,
              hintText: 'Search Movies...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }
}

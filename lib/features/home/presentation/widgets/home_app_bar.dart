import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  final VoidCallback? onPressed;
  const HomeAppBar({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/logo/logo.png', width: 120.w),

        IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
      ],
    );
  }
}

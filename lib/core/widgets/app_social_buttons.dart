import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSocialButtons extends StatelessWidget {
  const AppSocialButtons({
    super.key,
    required this.assetName,
    this.onPressed,
    this.colorFilter,
  });
  final String assetName;
  final VoidCallback? onPressed;
  final ColorFilter? colorFilter;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(15),
        minimumSize: Size.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      onPressed: onPressed,
      child: SvgPicture.asset(
        assetName,
        colorFilter: colorFilter,
        width: 30.w,
        height: 30.h,
      ),
    );
  }
}

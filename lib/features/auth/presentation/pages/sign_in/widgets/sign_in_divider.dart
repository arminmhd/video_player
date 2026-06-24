import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/theme/app_colors.dart';
import 'package:movie_stream_app/core/theme/app_text_styles.dart';

class SignInDivider extends StatelessWidget {
  const SignInDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.textMuted, thickness: 1),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            'or continue with',
            style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textMuted),
          ),
        ),

        const Expanded(
          child: Divider(color: AppColors.textMuted, thickness: 1),
        ),
      ],
    );
  }
}

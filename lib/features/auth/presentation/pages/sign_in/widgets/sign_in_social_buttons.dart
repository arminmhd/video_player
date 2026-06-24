import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/theme/app_colors.dart';
import 'package:movie_stream_app/core/widgets/app_social_buttons.dart';

class SignInSocialButtons extends StatelessWidget {
  final VoidCallback? onGoogle;
  final VoidCallback? onApple;
  final VoidCallback? onFacebook;

  const SignInSocialButtons({
    super.key,
    this.onGoogle,
    this.onApple,
    this.onFacebook,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppSocialButtons(
            assetName: 'assets/icons/google.svg',
            onPressed: onGoogle,
          ),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: AppSocialButtons(
            assetName: 'assets/icons/apple.svg',
            onPressed: onApple,
            colorFilter: ColorFilter.mode(
              AppColors.textPrimary,
              BlendMode.srcIn,
            ),
          ),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: AppSocialButtons(
            assetName: 'assets/icons/facebook.svg',
            onPressed: onFacebook,
          ),
        ),
      ],
    );
  }
}

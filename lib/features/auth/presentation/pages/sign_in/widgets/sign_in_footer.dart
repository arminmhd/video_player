import 'package:flutter/material.dart';
import 'package:movie_stream_app/core/theme/app_colors.dart';
import 'package:movie_stream_app/core/theme/app_text_styles.dart';

class SignInFooter extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback? onAction;

  const SignInFooter({
    super.key,
    required this.text,
    required this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted),
        ),

        TextButton(
          onPressed: onAction,
          child: Text(
            actionText,
            style: AppTextStyles.bodyLarge.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}

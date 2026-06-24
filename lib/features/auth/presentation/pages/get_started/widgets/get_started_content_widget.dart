import 'package:flutter/material.dart';
import 'package:movie_stream_app/core/extensions/spacing_extensions.dart';
import 'package:movie_stream_app/core/theme/app_text_styles.dart';
import 'package:movie_stream_app/core/widgets/app_button.dart';

class GetStartedContent extends StatelessWidget {
  final VoidCallback onGetStarted;

  const GetStartedContent({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Watch Movies\nAnywhere Anytime",
              style: AppTextStyles.headlineLarge,
            ),

            12.hSpace,

            Text(
              "Stream your favorite movies and series in high quality.",
              style: AppTextStyles.bodyLarge,
            ),

            32.hSpace,

            AppButton(
              text: "Get Started",
              onPressed: onGetStarted,
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}

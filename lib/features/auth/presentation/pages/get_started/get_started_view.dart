import 'package:flutter/material.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/get_started/widgets/get_started_bg_widget.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/get_started/widgets/get_started_content_widget.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/get_started/widgets/get_started_glow_widget.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/get_started/widgets/get_started_overlay_widget.dart';

class GetStartedView extends StatelessWidget {
  final VoidCallback onGetStarted;

  const GetStartedView({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const GetStartedBackground(),
        const GetStartedOverlay(),
        const GetStartedGlow(),
        GetStartedContent(onGetStarted: onGetStarted),
      ],
    );
  }
}

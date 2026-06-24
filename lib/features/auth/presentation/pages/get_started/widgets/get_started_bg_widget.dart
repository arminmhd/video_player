import 'dart:ui';
import 'package:flutter/material.dart';

class GetStartedBackground extends StatelessWidget {
  const GetStartedBackground({super.key});

  static const _blurSigma = 2.5;
  static const _assetPath = 'assets/video_player.png';

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: _blurSigma, sigmaY: _blurSigma),
      child: SizedBox.expand(child: Image.asset(_assetPath, fit: BoxFit.cover)),
    );
  }
}

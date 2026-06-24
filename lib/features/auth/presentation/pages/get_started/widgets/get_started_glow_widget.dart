import 'package:flutter/material.dart';

class GetStartedGlow extends StatelessWidget {
  const GetStartedGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topRight,
          radius: 1.2,
          colors: [Color(0x55FF3B3B), Colors.transparent],
        ),
      ),
    );
  }
}

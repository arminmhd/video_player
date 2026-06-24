import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();

  static final card = [
    BoxShadow(
      color: Colors.black.withValues(alpha: .15),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];
}

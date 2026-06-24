import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colors => theme.colorScheme;

  Size get size => MediaQuery.sizeOf(this);

  double get width => size.width;

  double get height => size.height;

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }
}

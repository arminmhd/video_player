import 'package:flutter/widgets.dart';

abstract final class AppRadius {
  static const xs = Radius.circular(6);
  static const sm = Radius.circular(10);
  static const md = Radius.circular(14);
  static const lg = Radius.circular(18);
  static const xl = Radius.circular(24);

  static const borderXs = BorderRadius.all(xs);
  static const borderSm = BorderRadius.all(sm);
  static const borderMd = BorderRadius.all(md);
  static const borderLg = BorderRadius.all(lg);
  static const borderXl = BorderRadius.all(xl);
}

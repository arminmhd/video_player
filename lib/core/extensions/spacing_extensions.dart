import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SpacingExtension on num {
  SizedBox get hSpace => SizedBox(height: h);

  SizedBox get wSpace => SizedBox(width: w);
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Utility class for consistent spacing throughout the app
class AppSpacing {
  AppSpacing._();

  // Horizontal spacing
  static double get mainPading => 16.w;
  static Widget get h4 => SizedBox(width: 4.w);
  static Widget get h8 => SizedBox(width: 8.w);
  static Widget get h12 => SizedBox(width: 12.w);
  static Widget get h16 => SizedBox(width: 16.w);
  static Widget get h20 => SizedBox(width: 20.w);
  static Widget get h24 => SizedBox(width: 24.w);
  static Widget get h32 => SizedBox(width: 32.w);
  static Widget get h40 => SizedBox(width: 40.w);
  static Widget get h48 => SizedBox(width: 48.w);
  static Widget get h95 => SizedBox(width: 95.w);

  // Vertical spacing
  static Widget get v4 => SizedBox(height: 4.h);
  static Widget get v8 => SizedBox(height: 8.h);
  static Widget get v12 => SizedBox(height: 12.h);
  static Widget get v16 => SizedBox(height: 16.h);
  static Widget get v20 => SizedBox(height: 20.h);
  static Widget get v24 => SizedBox(height: 24.h);
  static Widget get v32 => SizedBox(height: 32.h);
  static Widget get v40 => SizedBox(height: 40.h);
  static Widget get v48 => SizedBox(height: 48.h);
  static Widget get v56 => SizedBox(height: 56.h);
  static Widget get v64 => SizedBox(height: 64.h);

  // Custom spacing methods
  static Widget horizontal(double width) => SizedBox(width: width.w);
  static Widget vertical(double height) => SizedBox(height: height.h);
}

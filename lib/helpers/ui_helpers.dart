import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static double _VerticalSpaceSmall = 10.0.w;
  static double _VerticalSpaceMedium = 20.0.w;
  static double _VerticalSpaceSemiLarge = 40.0.w;
  static double _VerticalSpaceLarge = 60.0.w;

  // Vertical spacing constants. Adjust to your liking.
  static double _HorizontalSpaceSmall = 10.0.h;
  static double _HorizontalSpaceMedium = 20.0.h;
  static double _HorizontalSpaceSemiLarge = 40.0.h;
  static double _HorizontalSpaceLarge = 60.0.h;

  static Widget verticalSpaceSmall = SizedBox(height: _VerticalSpaceSmall);
  static Widget verticalSpaceMedium = SizedBox(height: _VerticalSpaceMedium);
  static Widget verticalSpaceSemiLarge =
      SizedBox(height: _VerticalSpaceSemiLarge);
  static Widget verticalSpaceLarge = SizedBox(height: _VerticalSpaceLarge);

  static Widget horizontalSpaceSmall = SizedBox(width: _HorizontalSpaceSmall);
  static Widget horizontalSpaceMedium = SizedBox(width: _HorizontalSpaceMedium);
  static Widget horizontalSpaceSemiLarge =
      SizedBox(width: _HorizontalSpaceSemiLarge);
  static Widget horizontalSpaceLarge = SizedBox(width: _HorizontalSpaceLarge);

  static Widget horizontalSpace(double width) => SizedBox(width: width);
  static Widget verticalSpace(double height) => SizedBox(height: height);
}

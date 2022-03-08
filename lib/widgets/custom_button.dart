import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_color.dart';

Widget customeButton({
  required String name,
  required VoidCallback onCallBack,
  required double height,
  required double minWidth,
  required Color color,
  required TextStyle textStyle,
  required BuildContext context,
}) {
  return MaterialButton(
    onPressed: onCallBack,
    child: Text(
      name,
      style: textStyle,
    ),
    height: height,
    minWidth: minWidth,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
    color:color,
    elevation: 5.0,
    splashColor: Colors.white.withOpacity(0.4),
  );
}

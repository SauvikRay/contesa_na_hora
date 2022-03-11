import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splashscreen_app.png'),
                  fit: BoxFit.cover)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 60.h,
                ),
                Image.asset(
                  'assets/images/user.png',
                  height: 130.h,
                  width: 130.h,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Image.asset(
                  'assets/images/rose_rosa.png',
                  height: 130.h,
                  width: 130.h,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Image.asset(
                  'assets/images/speed.png',
                  height: 60.h,
                  width: 60.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'CONTESTA',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.welcome,
                ),
                Text(
                  'NA HORA',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.welcome,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ]),
        ),
      ),
    );
  }
}

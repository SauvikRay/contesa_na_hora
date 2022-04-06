import 'package:contesta_na_hora/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../widgets/loading_indicators.dart';

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
                StreamBuilder(
                    stream: getProfileRXobj.getProfileData,
                    builder: (context, AsyncSnapshot profiledata) {
                      if (profiledata.hasData) {
                        Map data = profiledata.data;
                        return ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.r),
                          ),
                          child: Image.network(
                            data['image'],
                            height: 150.h,
                            width: 150.w,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else if (profiledata.hasError) {
                        return const SizedBox.shrink();
                      }
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: loadingIndicatorCircle(context: context),
                        ),
                      );
                    }),
                // Image.asset(
                //   'assets/images/user.png',
                //   height: 130.h,
                //   width: 130.h,
                // ),
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

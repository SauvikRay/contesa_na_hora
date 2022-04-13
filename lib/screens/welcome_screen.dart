import 'package:contesta_na_hora/constants/app_consotants.dart';
import 'package:contesta_na_hora/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/text_font_style.dart';
import '../widgets/loading_indicators.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appData = GetStorage();
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splashscreen_app.png'),
                fit: BoxFit.cover),
          ),
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
                        appData.write(KImageUrl, data['image']);
                        String imageLink = data['image'];
                        return ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.r),
                          ),
                          child: Image.network(
                            // 'https://lawyer.codemen.org/storage/images/portfolio/portfolio_image_1Etd.png',
                            imageLink,
                            height: 150.h,
                            width: 150.w,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else if (profiledata.hasError) {
                        return const SizedBox.shrink();
                      }
                      if (appData.read(KImageUrl) != null) {
                        return ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.r),
                          ),
                          child: Image.network(
                            appData.read(KImageUrl),
                            height: 150.h,
                            width: 150.w,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: loadingIndicatorCircle(context: context),
                          ),
                        );
                      }
                    }),

                // Image.network(
                //   'https://lawyer.codemen.org/storage/images/portfolio/portfolio_image_1Etd.png',
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

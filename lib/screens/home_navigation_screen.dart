import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_color.dart';


class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  //Variable for navigation Index
  int _currentIndex = 0;
  //Variable for navigation Color Index
  int _colorIndex = 0;

  @override
  Widget build(BuildContext context) {
     // Theme For Text
    final sub1 = Theme.of(context).textTheme.subtitle1; //12,bold,
    final sub2 = Theme.of(context).textTheme.subtitle2; //12,normal,
    final head5 = Theme.of(context).textTheme.headline5; // 14, normal
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,

        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text('My App'),
          actions:<Widget> [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: IconButton(
                  onPressed: (){},
                  icon:const Icon(Icons.add_box_rounded,size: 35.0,),
              ),
            ),
          ],


          flexibleSpace:
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r),bottomRight:Radius.circular(20.r) )
            ),
            child: Image.asset('assets/images/splashscreen_app.png',fit: BoxFit.cover,),
          ),



        ),
        body: Center(
          child: Text('Navigation Screen'),
        ),


        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton:Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: CustomNavigationBar(
              backgroundColor: Colors.white,
              borderRadius: Radius.circular(10.r),
              items: [

                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/home.svg',
                    color: (_colorIndex == 0)
                        ? AppColors.highLightText
                        : Colors.grey.shade900,
                    width: 20.w,
                    height: 20.h,
                  ),
                  title: Text(
                    'Home',
                    style: (_colorIndex == 0)
                        ? sub1?.copyWith(color: AppColors.highLightText)
                        : sub2?.copyWith(color: Colors.grey.shade900),
                  ),
                ),
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/content.svg',
                    color: (_colorIndex == 1)
                        ? AppColors.highLightText
                        : Colors.grey.shade700,
                    width: 20.w,
                    height: 20.h,
                  ),
                  title: Text(
                    'Contestar',
                    style: (_colorIndex == 1)
                        ? sub1?.copyWith(color: AppColors.highLightText)
                        : sub2?.copyWith(color: Colors.grey.shade700),
                  ),
                ),
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/publication.svg',
                    color: (_colorIndex == 2)
                        ? AppColors.highLightText
                        : Colors.grey.shade700,
                    width: 20.w,
                    height: 20.h,
                  ),
                  title: Text(
                    'Publication',
                    style: (_colorIndex == 2)
                        ? sub1?.copyWith(color: AppColors.highLightText)
                        : sub2?.copyWith(color: Colors.grey.shade700),
                  ),
                ),
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/faq.svg',
                    color: (_colorIndex == 3)
                        ? AppColors.highLightText
                        : Colors.grey.shade900,
                    width: 20.w,
                    height: 20.h,
                  ),
                  title: Text(
                    'Faqs',
                    style: (_colorIndex == 3)
                        ? sub1?.copyWith(color: AppColors.highLightText)
                        : sub2?.copyWith(color: Colors.grey.shade700),
                  ),
                ),
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/contact.svg',
                    color: (_colorIndex == 3)
                        ? AppColors.highLightText
                        : Colors.grey.shade700,
                    width: 20.w,
                    height: 20.h,
                  ),
                  title: Text(
                    'Contactos',
                    style: (_colorIndex == 3)
                        ? sub1?.copyWith(color: AppColors.highLightText)
                        : sub2?.copyWith(color: Colors.grey.shade700),
                  ),
                ),

              ]

          ),
        ) ,
      ),
    );
  }
}

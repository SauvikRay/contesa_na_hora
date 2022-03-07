import 'package:contesta_na_hora/screens/contactos_screen.dart';
import 'package:contesta_na_hora/screens/faqs_screen.dart';
import 'package:contesta_na_hora/screens/publicocaes_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'constants/app_color.dart';
import 'constants/text_font_style.dart';
import 'screens/contestar_screen.dart';
import 'screens/home_screen.dart';

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

  bool _isFisrtBuild = true;
  bool _isPressed = true;

  final _screens = [
    const HomeScreen(),
    const ContestarScreen(),
    const PublicationScreen(),
    const FaqsScreen(),
    const ContactScreen(),
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Object? args;
    // Widget? screenPage;
    //  if (_isFisrtBuild) {
    //   //_isFirstBuild true then getting value from MenuWidget.
    // //  args = ModalRoute.of(context)!.settings.arguments;
    // }
    // if (args != null) {
    //   //Update _colorIndex because not showing the color.
    //   _colorIndex = 4;
    //   //screenPage = args as Widget;
    // }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,

        // appBar:
        // AppBar(
        //   title: const Text('My App'),
        //   actions:<Widget> [
        //     Padding(
        //       padding: EdgeInsets.only(right: 10.w),
        //       child: IconButton(
        //           onPressed: (){},
        //           icon:const Icon(Icons.add_box_rounded,size: 35.0,),
        //       ),
        //     ),
        //   ],

        //   flexibleSpace:
        //   Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r),bottomRight:Radius.circular(20.r) )
        //     ),
        //     child: Image.asset('assets/images/splashscreen_app.png',fit: BoxFit.cover,),
        //   ),

        // ),

        body: Center(
          child: _screens.elementAt(_currentIndex),
        ),

        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: CustomNavigationBar(
              //scaleCurve: Curves.linear,
              //bubbleCurve: Curves.bounceIn,
              strokeColor: AppColors.primaryColor,
              backgroundColor: Colors.white,
              borderRadius: Radius.circular(10.r),
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  // args = null;
                  // screenPage = null;
                  _isFisrtBuild = false;
                  _currentIndex = index;
                  _colorIndex = index;
                  _isPressed = true;
                });
              },
              items: [
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/home.svg',
                    color: (_colorIndex == 0)
                        ? AppColors.primaryColor
                        : AppColors.linkColor,
                    width: 20.w,
                    height: 20.h,
                  ),
                  title: Text(
                    'Home',
                    style: (_colorIndex == 0)
                        ? TextFontStyle.sub2
                        : TextFontStyle.sub1,
                  ),
                ),
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/content.svg',
                    color: (_colorIndex == 1)
                        ? AppColors.primaryColor
                        : AppColors.linkColor,
                    width: 20.w,
                    height: 20.h,
                  ),
                  title: Text(
                    'Contestar',
                    style: (_colorIndex == 1)
                        ? TextFontStyle.sub2
                        : TextFontStyle.sub1,
                  ),
                ),
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/publication.svg',
                    color: (_colorIndex == 2)
                        ? AppColors.primaryColor
                        : AppColors.linkColor,
                    width: 20.w,
                    height: 20.h,
                  ),
                  title: Text('Publication',
                      style: (_colorIndex == 2)
                          ? TextFontStyle.sub2
                          : TextFontStyle.sub1),
                ),
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/faq.svg',
                    color: (_colorIndex == 3)
                        ? AppColors.primaryColor
                        : AppColors.linkColor,
                    width: 20.w,
                    height: 20.h,
                  ),
                  title: Text('Faqs',
                      style: (_colorIndex == 3)
                          ? TextFontStyle.sub2
                          : TextFontStyle.sub1),
                ),
                CustomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/contact.svg',
                    color: (_colorIndex == 4)
                        ? AppColors.primaryColor
                        : AppColors.linkColor,
                    width: 20.w,
                    height: 20.h,
                  ),
                  title: Text('Contactos',
                      style: (_colorIndex == 4)
                          ? TextFontStyle.sub2
                          : TextFontStyle.sub1),
                ),
              ]),
        ),
      ),
    );
  }
}

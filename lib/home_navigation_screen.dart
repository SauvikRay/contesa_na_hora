import 'package:contesta_na_hora/screens/contactos_screen.dart';
import 'package:contesta_na_hora/screens/faqs_screen.dart';
import 'package:contesta_na_hora/screens/publicocaes_screen.dart';
import 'package:contesta_na_hora/widgets/app_bar_widget.dart';
import 'package:contesta_na_hora/widgets/app_drawer.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'constants/app_color.dart';
import 'constants/text_font_style.dart';
import 'helpers/all_routes.dart';
import 'helpers/notification_service.dart';
import 'networks/api_acess.dart';
import 'screens/contestar_screen.dart';
import 'screens/home_screen.dart';
import 'screens/publication_details_screen.dart';

class NavigationScreen extends StatefulWidget {
  final Widget? pageNum;
  const NavigationScreen({
    Key? key,
    this.pageNum,
  }) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  //Variable for navigation Index
  int _currentIndex = 0;
  //Variable for navigation Color Index
  int _colorIndex = 0;

  bool _isFisrtBuild = true;
  bool _navigationOn = true;

  final List<StatefulWidget> _screens = [
    const HomeScreen(),
    const ContestarScreen(),
    const PublicationScreen(),
    const FaqsScreen(),
    const ContactScreen(),
  ];

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getToken().then(
      (value) async {
        print("FCM -- > token [ $value ]");
      },
    );

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) async {
        print("${FirebaseMessaging.instance.getInitialMessage}");
        if (message != null) {
          print("New Notification");
          if (message.data['_id'] != null) {
            await getBloagDetailsRXobj
                .fetchBlogDetailsData(message.data['_id'].toString());
            Navigator.pushNamed(
              context,
              Routes.navigation,
              arguments: const PublicationDetailsScreen(),
            );
            print("${message.data['_id']}");
          }
        }
      },
    );
    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen((message) async {
      print("FirebaseMessaging.onMessage.listen");
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data11 ${message.data}");
        LocalNotificationService.createanddisplaynotification(message);
      }
    });

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      print("FirebaseMessaging.onMessageOpenedApp.listen");
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data22 ${message.data['_id']}");
        if (message.data['_id'] != null) {
          await getBloagDetailsRXobj
              .fetchBlogDetailsData(message.data['_id'].toString());
          Navigator.pushNamed(
            context,
            Routes.navigation,
            arguments: const PublicationDetailsScreen(),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Object? args;
    StatefulWidget? screenPage;
    if (_isFisrtBuild) {
      args = ModalRoute.of(context)!.settings.arguments;
    }
    if (args != null) {
      _colorIndex = 5;
      screenPage = args as StatefulWidget;
      var newColorindex = -1;
      for (var element in _screens) {
        newColorindex++;
        if (element.toString() == screenPage.toString()) {
          _colorIndex = newColorindex;
          break;
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: const MainAppBarWidget(),
        drawer: const AppDrawer(),
        onDrawerChanged: (isOpened) => setState(() {
          _navigationOn = !isOpened;
        }),
        body: Center(
          child: (screenPage != null)
              ? screenPage
              : _screens.elementAt(_currentIndex),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: _navigationOn
            ? Padding(
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
                        args = null;
                        screenPage = null;
                        _isFisrtBuild = false;
                        _currentIndex = index;
                        _colorIndex = index;
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
              )
            : Container(),
      ),
    );
  }
}

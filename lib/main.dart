import 'package:contesta_na_hora/constants/custome_theme.dart';
import 'package:contesta_na_hora/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './screens/welcome_screen.dart';
import 'screens/home_navigation_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    FlutterNativeSplash.remove();
    Future.delayed(const Duration(seconds: 5),).then((_) {
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(360, 690),
       minTextAdapt: true,
      splitScreenMode: true,
      builder: ()=>
       MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.mainTheme,
        builder: (context,widget){
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), 
            child: widget!);
          
        },
        
        home: _isLoading ? const WelcomeScreen(): const NavigationScreen(),
      ),
    );
  }
}



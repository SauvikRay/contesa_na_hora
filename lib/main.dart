import 'package:contesta_na_hora/constants/custome_theme.dart';
import 'package:contesta_na_hora/controller/contasa.dart';
import 'package:contesta_na_hora/helpers/dio/dio.dart';
import 'package:contesta_na_hora/networks/api_acess.dart';
import 'package:contesta_na_hora/networks/get_faq/rx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import './screens/welcome_screen.dart';
import 'helpers/all_routes.dart';
import 'helpers/navigation_service.dart';
import 'home_navigation_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;

  @override
  void initState() {
    FlutterNativeSplash.remove();
    DioSingleton.instance.create();
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    await getProfileRXobj.fetchProfileData();
    await getFaqRXobj.fetchFaqData();
    await getBlogRXobj.fetchBlogData();
    //await getPublicationRXobj.fetchPublicationData();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Contasa>(create: ((context) => Contasa()))
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.mainTheme,
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!);
          },
          //initialRoute: Routes.home,
          navigatorKey: NavigationService.navigatorKey,
          onGenerateRoute: RouteGenerator.generateRoute,
          routes: {
            Routes.navigation: (context) => const NavigationScreen(),
          },
          home: _isLoading ? const WelcomeScreen() : const NavigationScreen(),
        ),
      ),
    );
  }
}

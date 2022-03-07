import 'dart:io';

import 'package:contesta_na_hora/screens/contactos_screen.dart';
import 'package:contesta_na_hora/screens/contestar_screen.dart';
import 'package:contesta_na_hora/screens/faqs_screen.dart';
import 'package:contesta_na_hora/screens/home_screen.dart';
import 'package:contesta_na_hora/screens/publicocaes_screen.dart';
import 'package:contesta_na_hora/screens/service_screen.dart';
import 'package:contesta_na_hora/screens/sobrenos_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  //static const String loader='/loader';
  static const String home = '/home';
  static const String contact = '/contact';
  static const String contestar = '/contestar';
  static const String faq = '/faq';
  static const String publication = '/publication';
  static const String service = '/service';
  static const String sobrenos = '/sobrenos';
}

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const HomeScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const HomeScreen());

      case Routes.contact:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ContactScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const ContactScreen());
      case Routes.contestar:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ContestarScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const ContestarScreen());
      case Routes.faq:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const FaqsScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const FaqsScreen());
      case Routes.publication:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const PublicationScreen(), settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const PublicationScreen());
      case Routes.service:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ServiceScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const ServiceScreen());
      case Routes.sobrenos:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SobrenosScreen(),
                settings:
                    settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
            : CupertinoPageRoute(builder: (context) => const SobrenosScreen());

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(microseconds: 100),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ),
              child: child,
            );
          },
        );
}

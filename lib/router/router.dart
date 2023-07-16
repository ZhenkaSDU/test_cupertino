import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_cupertino/features/auth/auth_screen.dart';
import 'package:test_cupertino/main_screen.dart';
import 'routing_const.dart';

class AppRouter {

  static Route generateRoute(RouteSettings routeSettings) {
    Box box = Hive.box('id');
    Box phone = Hive.box("phoneNumber");
    switch (routeSettings.name) {
      case AuthRoute:
        return MaterialPageRoute(
          builder: (context) => AuthScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
    }
  }
}
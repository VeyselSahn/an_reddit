import 'package:an_reddit/screen/main_page/view/main_screen.dart';
import 'package:flutter/material.dart';

import '../../core_shelf.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.main:
        return normalNavigate(const MainScreen());
      default:
        return normalNavigate(const MainScreen());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}

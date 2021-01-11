import 'package:flutter/material.dart';
import 'package:templeteproject/core/components/widgets/not_found.dart';
import 'package:templeteproject/core/constants/navigations.dart';
import 'package:templeteproject/view/authenticate/test/view/test.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestView());
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => NotFound(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

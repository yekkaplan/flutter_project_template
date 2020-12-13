import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:templeteproject/core/init/navigation/navigatin_service.dart';
import 'package:templeteproject/core/init/notifier/theme_notifier.dart';

class ApplicationProvider {
  static ApplicationProvider _instance;

  static ApplicationProvider get instance {
    if (_instance == null) {
      _instance = ApplicationProvider._init();
    }
    return _instance;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier()),
    Provider.value(value: NavigationService.instance)
  ];
  List<SingleChildWidget> uiChangesItem = [];
  List<SingleChildWidget> singleItems = [];
}

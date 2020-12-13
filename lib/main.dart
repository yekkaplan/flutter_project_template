import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:templeteproject/core/constants/app/ApplicationConstants.dart';
import 'package:templeteproject/core/init/cache/locale.manager.dart';
import 'package:templeteproject/core/init/lang/lang_manager.dart';
import 'package:templeteproject/core/init/navigation/navigatin_service.dart';
import 'package:templeteproject/core/init/navigation/navigator_route.dart';
import 'package:templeteproject/core/init/notifier/theme_notifier.dart';
import 'package:templeteproject/view/authenticate/test/view/test.dart';

import 'core/init/notifier/provider_list.dart';

void main() {
  LocaleManager.preferencesInit();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
        child: MyApp(),
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: TestView(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:templeteproject/core/constants/enums/app_theme_enum.dart';
import 'package:templeteproject/core/init/network/network_manager.dart';
import 'package:templeteproject/core/init/notifier/theme_notifier.dart';
import 'package:templeteproject/view/authenticate/test/model/test_model.dart';

part 'test_viewmodel.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  BuildContext context;

  void setContext(BuildContext context) {
    this.context = context;
  }

  @observable
  int number = 0;

  bool isLoading = false;

  @action
  void incrementCount() {
    number++;
  }

  changeTheme(BuildContext context) {
    Provider.of<ThemeNotifier>(context).changeValue(AppTheme.DARK);
  }

  Future<void> getSampleRequest() async {
    isLoading = true;
    final list =
        await NetworkManager.instance.dioGet<TestModel>("x", TestModel());
    if (list is List) {
      print(true);
    }
    isLoading = false;
  }
}

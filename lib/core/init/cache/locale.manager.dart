import 'package:shared_preferences/shared_preferences.dart';
import 'package:templeteproject/core/constants/enums/locale_keys_enum.dart';

// eager singleton
class LocaleManager {
  SharedPreferences _preferences;

  // static olduğu için proje ayağa kalkarken init oluyor.
  static LocaleManager _instance = LocaleManager._init();

  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static preferencesInit() async {
    if (instance._preferences == null) {
      instance._preferences = await SharedPreferences.getInstance();
    }
    return;
  }

  Future<void> setStringValue(PreferencesKeys localeKeys, String value) async {
    await _preferences.setString(localeKeys.toString(), value);
  }

  String getStringValue(PreferencesKeys key) =>
      _preferences.getString(key.toString());
}

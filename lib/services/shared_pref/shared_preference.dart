import 'package:my_lpg_book/services/shared_pref/shared_pref_variable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceLogic{
  static Future<bool> isLogIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isLogIn = pref.getBool(AppSharedPreference.isLogin);
    if (isLogIn == null) {
      pref.setBool(AppSharedPreference.isLogin, false);
      return false;
    } else {
      return isLogIn;
    }
  }

  static Future<void> setLoginFalse() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isLogIn = pref.getBool(AppSharedPreference.isLogin);
    if (isLogIn == null) {
      pref.setBool(AppSharedPreference.isLogin, false);
    } else {
      pref.setBool(AppSharedPreference.isLogin, false);
    }
  }

  static Future<void> setLoginTrue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isLogIn = pref.getBool(AppSharedPreference.isLogin);
    if (isLogIn == null) {
      pref.setBool(AppSharedPreference.isLogin, true);
    } else {
      pref.setBool(AppSharedPreference.isLogin, true);
    }
  }

  static Future<bool> isfreshInstall() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isfreshInstal = pref.getBool(AppSharedPreference.firstInstall);

    if(isfreshInstal==null){
      await pref.setBool(AppSharedPreference.firstInstall, false);
      return true;
    } else if(isfreshInstal){
      await pref.setBool(AppSharedPreference.firstInstall, false);
      return true;
    }else{
      await pref.setBool(AppSharedPreference.firstInstall, false);
      return true;
    }
  }

}
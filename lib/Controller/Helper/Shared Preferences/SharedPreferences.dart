import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/Utils.dart';

class AppSharedPreferences {
  static SharedPreferences? _preferences;

  static Future<SharedPreferences?> getInstance() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
      return _preferences;
    }
    return _preferences;
  }

  static String isShowAppUpdatePopUp = "is_show_app_update_popup";

  static String appVersion = "app_version";
  static String authToken = "token";
  static String fcmToken = "fcm_token";
  static String userId = "user_id";
  static String userType = "user_type";

  static String cookie = "cookie";
  static String cookieAdmin = "cookieAdmin";
  static String cookieName = "cookieName";
  static String username = "username";
  static String phone = "phone";
  static String nicename = "nicename";
  static String email = "email";
  static String registered = "registered";
  static String displayname = "displayname";
  static String firstname = "firstname";
  static String lastname = "lastname";
  static String nickname = "nickname";
  static String IS_Logged_In = "LoggedIn";


  /// ADD DATA
  static addStringValueToSharedPref(
      {required String variableName, required String variableValue}) async {
    await _preferences?.setString(variableName, variableValue);
  }

  static addBoolValueToSharedPref(
      {required String variableName, required bool variableValue}) async {
    await _preferences?.setBool(variableName, variableValue);
  }

  static addIntValueToSharedPref(
      {required String variableName, required int variableValue}) async {
    await _preferences?.setInt(variableName, variableValue);
  }

  static addStringListValueToSharedPref({required String variableName,
    required List<String> variableValue}) async {
    await _preferences?.setStringList(variableName, variableValue);
  }

  static removeValueToSharedPref({required String variableName}) async {
    await _preferences?.remove(variableName);
  }

  ///GET DATA
  static String? getStringFromSharedPref({required String variableName}) {
    String? returnValue = _preferences?.getString(variableName);
    return returnValue;
  }

  static int? getIntValueFromSharedPref({required String variableName}) {
    int? returnValue = _preferences?.getInt(variableName);
    return returnValue;
  }

  static bool? getBoolValueFromSharedPref({required String variableName}) {
    bool? returnValue = _preferences?.getBool(variableName);
    return returnValue;
  }

  static List<String>? getStringListValueFromSharedPref(
      {required String variableName}) {
    List<String>? returnValue = _preferences?.getStringList(variableName);
    return returnValue;
  }

  ///CLEAR SHARED PREFERENCE
  static Future clearSharedPref() async {
    Utils.printLog("Shared Preference clean...");
    // String autoUserName =
    //     getStringFromSharedPref(variableName: autoFillUserName) ?? "";
    // String autoUserPassword =
    //     getStringFromSharedPref(variableName: autoFillUserPassword) ?? "";
    // String isAutoFill =
    //     getStringFromSharedPref(variableName: isAutoFillUserPassword) ?? "";
    // _preferences?.clear();
    // if (isAutoFill == "true") {
    //   await addStringValueToSharedPref(
    //       variableName: isAutoFillUserPassword, variableValue: "false");
    //   await addStringValueToSharedPref(
    //       variableName: autoFillUserName, variableValue: autoUserName);
    //   await addStringValueToSharedPref(
    //       variableName: autoFillUserPassword, variableValue: autoUserPassword);
    // }
  }
}

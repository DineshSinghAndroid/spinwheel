
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as G;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:spinwheel/CommonScreens/Onboarding/app_onboarding_screen.dart';
import 'package:spinwheel/Controller/Helper/Shared%20Preferences/SharedPreferences.dart';

import '../../../main.dart';
import '../../Models/adminModels/LoginModel.dart';
import '../../Models/adminModels/ProfleModel.dart';
import '../../Models/adminModels/RegisterModel.dart';
import '../../Models/superAdminModels/SuperAdminHomeDataModel.dart';
import '../Helper/ConnectionValidator/ConnectionValidator.dart';
import '../Utils/Utils.dart';
import 'WebConstant.dart';
import 'package:dio/dio.dart';

class ApiControllerAdmin {
  final Dio _dio = Dio();

  ///register
  Future<RegisterModel?> registerApiHit({
    context,
    required String url,
    required dictData,
    String? token,
  }) async {
    RegisterModel? result;

    if (await ConnectionValidator().check()) {
      try {
        final response = await requestPostApi(
            context: context, url: url, dictData: dictData, token: token);
        if (response?.data != null && response?.statusCode == 200) {
          result = RegisterModel.fromJson(response?.data);
          return result;
        } else {
          return result;
        }
      } catch (e) {
        Utils.printLog("Exception_main1: $e");
        return result;
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please check network connection and try again!");
    }
    return result;
  }

  ///login
  Future<LoginModel?> loginApiHit({
    context,
    required String url,
    required dictData,
    String? token,
  }) async {
    LoginModel? result;

    if (await ConnectionValidator().check()) {
      try {
        final response = await requestPostApi(
            context: context, url: url, dictData: dictData, token: token);
        if (response?.data != null && response?.statusCode == 200) {
          return result = LoginModel.fromJson(response?.data);
        } else {
          return result;
        }
      } catch (e) {
        Utils.printLog("Exception_main1 s: $e");

        return result;
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please check network connection and try again!");
    }
    return result;
  }


  ///getprofileDataApi
  Future<ProfileDataModelHome?> getprofileDataApi({
    context,
    required String url,
    required dictData,
    String? token,
  }) async {
    ProfileDataModelHome? result;

    if (await ConnectionValidator().check()) {
      try {
        final response = await requestPostApi(
            context: context, url: url, dictData: dictData, token: token);
        if (response?.data != null && response?.statusCode == 200) {
          return result = ProfileDataModelHome.fromJson(response?.data);
        } else {
          return result;
        }
      } catch (e) {
        Utils.printLog("Exception_main1 s: $e");

        return result;
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please check network connection and try again!");
    }
    return result;
  }

  ///methods
  Future<Response?> requestPostApi(
      {required context, String? url, required dictData, String? token}) async {
    Dio _dio = Dio();
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        "Content-type": "application/json",
        "Authorization": 'Bearer $token'
      };

      Utils.printLog("Headers: $headers");
      Utils.printLog("Url:  $url");
      Utils.printLog("Token:  $token");
      Utils.printLog("formData: $dictData");

      BaseOptions options = BaseOptions(
          baseUrl: WebApiConstantAdmin.BASE_URL,
          receiveTimeout: Duration(seconds: 5),
          connectTimeout: Duration(seconds: 5),
          headers: headers);

      _dio.options = options;
      Response response = await _dio.post(url!,
          data: dictData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) => true,
            headers: headers,
          ));

      Utils.printLog("Response: $response");
      if (response.statusCode == 401) {
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        prefs.remove('userId');
        prefs.remove('name');
        prefs.remove('email');
        prefs.remove('mobile');
        prefs.setBool(AppSharedPreferences.IS_Logged_In, false);
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation animation, Animation secondaryAnimation) {
              return AppOnboardingScreen();
            }, transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return   SlideTransition(
                position:   Tween<Offset>(
                  begin:   const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            }),
            (Route route) => false);
      }


      return response;
    } catch (error) {
      Utils.printLog("Exception_Main: $error");
      return null;
    }
  }

  Future<Response?> requestGetForApi(
      {required context,
      String? url,
      Map<String, dynamic>? dictParameter,
      String? token}) async {
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer $authToken",
        "Connection": "Keep-Alive",
        "Keep-Alive": "timeout=5, max=1000",
      };

      //  final prefs = await SharedPreferences.getInstance();
      // String userId = prefs.getString(AppSharedPreferences.userId) ?? "";
      //  String sessionId = prefs.getString(AppSharedPreferences.sessionId) ?? "";

      Utils.printLog("Headers: $headers");
      Utils.printLog("Url:  $url");
      Utils.printLog("Token:  $token");
      Utils.printLog("DictParameter: $dictParameter");

      BaseOptions options = BaseOptions(
          baseUrl: WebApiConstantAdmin.BASE_URL,
          receiveTimeout: Duration(minutes: 1),
          connectTimeout: Duration(minutes: 1),
          headers: headers,
          validateStatus: (_) => true);

      _dio.options = options;
      Response response = await _dio.get(url!, queryParameters: dictParameter);
      Utils.printLog("Response_headers: ${response.headers}");
      Utils.printLog("Response_data: ${response.data}");

      checkTokenStatus(response1: response.toString());

      return response;
    } catch (error) {
      Utils.printLog("Exception_Main: $error");
      return null;
    }
  }

  Future<Response?> requestMultipartApi(
      {required context,
      String? url,
      Map<String, dynamic>? dictParameter,
      String? token}) async {
    try {
      Map<String, String> headers = {
        // "Content-type": "application/json",
        // "Authkey": WebApiConstantAdmin.AUTH_KEY,
        "Authorization": "Bearer $token",
        "Connection": "Keep-Alive",
        "Keep-Alive": "timeout=5, max=1000"
      };

      var formData = FormData.fromMap(dictParameter!);

      Utils.printLog("Headers: $headers");
      Utils.printLog("Url:  $url");
      Utils.printLog("Token:  $token");
      Utils.printLog("formData: ${formData.fields.toString()}");

      BaseOptions options = BaseOptions(
          baseUrl: WebApiConstantAdmin.BASE_URL,
          receiveTimeout: Duration(minutes: 1),
          connectTimeout: Duration(minutes: 1),
          headers: headers);

      _dio.options = options;
      Response response = await _dio.post(url!,
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) => true,
            headers: headers,
          ));

      Utils.printLog("Response: $response");
      if (response.statusCode == 401) {
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        prefs.remove('userId');
        prefs.remove('name');
        prefs.remove('email');
        prefs.remove('mobile');
        prefs.setBool(AppSharedPreferences.IS_Logged_In, false);
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation animation, Animation secondaryAnimation) {
              return AppOnboardingScreen();
            }, transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return new SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            }),
            (Route route) => false);
      }

      checkTokenStatus(
          response1: response.toString(), statusCode: response.statusCode);

      return response;
    } catch (error) {
      Utils.printLog("Exception_Main: $error");
      return null;
    }
  }

  ///Check Token Status
  Future<void> checkTokenStatus({required String response1, statusCode}) async {
    bool isTokenExpired =
        response1.toString().contains("Expired token") || statusCode == 401;
    if (isTokenExpired) {
      SharedPreferences.getInstance().then((value) {
        value.clear();
        ToastCustom.showToastWithLength(
            msg: "You need to login back to use app",
            toastLength: Toast.LENGTH_LONG);
        Utils.printLog("Token expired redirecting to login page ::::::::");

        G.Get.deleteAll();
      });
    }
  }
}

class ApiControllerGames {
  final Dio _dio = Dio();

  ///methods
  Future<Response?> requestPostApi(
      {required context, String? url, required dictData, String? token}) async {
    Dio _dio = Dio();
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        "Content-type": "application/json",
        "Authorization": 'Bearer $token'
      };

      Utils.printLog("Headers: $headers");
      Utils.printLog("Url:  $url");
      Utils.printLog("Token:  $token");
      Utils.printLog("formData: $dictData");

      BaseOptions options = BaseOptions(
          baseUrl: WebApiConstantAdmin.BASE_URL,
          receiveTimeout: Duration(seconds: 5),
          connectTimeout: Duration(seconds: 5),
          headers: headers);

      _dio.options = options;
      Response response = await _dio.post(url!,
          data: dictData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) => true,
            headers: headers,
          ));

      Utils.printLog("Response: $response");
      if (response.statusCode == 401) {
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        prefs.remove('userId');
        prefs.remove('name');
        prefs.remove('email');
        prefs.remove('mobile');
        prefs.setBool(AppSharedPreferences.IS_Logged_In, false);
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation animation, Animation secondaryAnimation) {
              return AppOnboardingScreen();
            }, transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return new SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            }),
            (Route route) => false);
      }

      // if (response.statusCode == 401) {
      //   final prefs = await SharedPreferences.getInstance();
      //   prefs.remove('token');
      //   prefs.remove('userId');
      //   prefs.remove('name');
      //   prefs.remove('email');
      //   prefs.remove('mobile');
      //   prefs.setBool(WebConstant.IS_LOGIN, false);
      //   Navigator.pushAndRemoveUntil(
      //       context,
      //       PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
      //         return OnBoardingScreen();
      //       }, transitionsBuilder: (BuildContext context, Animation<double> animation,
      //           Animation<double> secondaryAnimation, Widget child) {
      //         return new SlideTransition(
      //           position: new Tween<Offset>(
      //             begin: const Offset(1.0, 0.0),
      //             end: Offset.zero,
      //           ).animate(animation),
      //           child: child,
      //         );
      //       }),
      //           (Route route) => false);
      // }
      return response;
    } catch (error) {
      Utils.printLog("Exception_Main: $error");
      return null;
    }
  }

  Future<Response?> requestGetForApi(
      {required context,
      String? url,
      Map<String, dynamic>? dictParameter,
      String? token}) async {
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer $authToken",
        "Connection": "Keep-Alive",
        "Keep-Alive": "timeout=5, max=1000",
      };

      //  final prefs = await SharedPreferences.getInstance();
      // String userId = prefs.getString(AppSharedPreferences.userId) ?? "";
      //  String sessionId = prefs.getString(AppSharedPreferences.sessionId) ?? "";

      Utils.printLog("Headers: $headers");
      Utils.printLog("Url:  $url");
      Utils.printLog("Token:  $token");
      Utils.printLog("DictParameter: $dictParameter");

      BaseOptions options = BaseOptions(
          baseUrl: WebApiConstantAdmin.BASE_URL,
          receiveTimeout: Duration(minutes: 1),
          connectTimeout: Duration(minutes: 1),
          headers: headers,
          validateStatus: (_) => true);

      _dio.options = options;
      Response response = await _dio.get(url!, queryParameters: dictParameter);
      Utils.printLog("Response_headers: ${response.headers}");
      Utils.printLog("Response_data: ${response.data}");

      checkTokenStatus(response1: response.toString());

      return response;
    } catch (error) {
      Utils.printLog("Exception_Main: $error");
      return null;
    }
  }

  Future<Response?> requestMultipartApi(
      {required context,
      String? url,
      Map<String, dynamic>? dictParameter,
      String? token}) async {
    try {
      Map<String, String> headers = {
        // "Content-type": "application/json",
        // "Authkey": WebApiConstantAdmin.AUTH_KEY,
        "Authorization": "Bearer $token",
        "Connection": "Keep-Alive",
        "Keep-Alive": "timeout=5, max=1000"
      };

      var formData = FormData.fromMap(dictParameter!);

      Utils.printLog("Headers: $headers");
      Utils.printLog("Url:  $url");
      Utils.printLog("Token:  $token");
      Utils.printLog("formData: ${formData.fields.toString()}");

      BaseOptions options = BaseOptions(
          baseUrl: WebApiConstantAdmin.BASE_URL,
          receiveTimeout: Duration(minutes: 1),
          connectTimeout: Duration(minutes: 1),
          headers: headers);

      _dio.options = options;
      Response response = await _dio.post(url!,
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) => true,
            headers: headers,
          ));

      Utils.printLog("Response: $response");
      if (response.statusCode == 401) {
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        prefs.remove('userId');
        prefs.remove('name');
        prefs.remove('email');
        prefs.remove('mobile');
        prefs.setBool(AppSharedPreferences.IS_Logged_In, false);
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation animation, Animation secondaryAnimation) {
              return AppOnboardingScreen();
            }, transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return new SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            }),
            (Route route) => false);
      }

      checkTokenStatus(
          response1: response.toString(), statusCode: response.statusCode);

      return response;
    } catch (error) {
      Utils.printLog("Exception_Main: $error");
      return null;
    }
  }

  ///Check Token Status
  Future<void> checkTokenStatus({required String response1, statusCode}) async {
    bool isTokenExpired =
        response1.toString().contains("Expired token") || statusCode == 401;
    if (isTokenExpired) {
      SharedPreferences.getInstance().then((value) {
        value.clear();
        ToastCustom.showToastWithLength(
            msg: "You need to login back to use app",
            toastLength: Toast.LENGTH_LONG);
        Utils.printLog("Token expired redirecting to login page ::::::::");

        G.Get.deleteAll();
      });
    }
  }
}

class ApiControllerSuperAdmin {
  final Dio _dio = Dio();

  ///get home data superadmin
  Future<SuperAdminHomeDataMode?> getHomeDataApi({
    context,
    required String url,
    required dictData,
    String? token,
  }) async {
    SuperAdminHomeDataMode? result;

    if (await ConnectionValidator().check()) {
      try {
        final response = await requestPostApi(
            context: context, url: url, dictData: dictData, token: token);
        if (response?.data != null && response?.statusCode == 200) {
          return result = SuperAdminHomeDataMode.fromJson(response?.data);
        } else {
          return result;
        }
      } catch (e) {
        Utils.printLog("Exception_main1 s: $e");

        return result;
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please check network connection and try again!");
    }
    return result;
  }



  ///methods
  Future<Response?> requestPostApi(
      {required context, String? url, required dictData, String? token}) async {
    Dio _dio = Dio();
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        "Content-type": "application/json",
        "Authorization": 'Bearer $token'
      };

      Utils.printLog("Headers: $headers");
      Utils.printLog("Url:  $url");
      Utils.printLog("Token:  $token");
      Utils.printLog("formData: $dictData");

      BaseOptions options = BaseOptions(
          baseUrl: WebApiConstantSuperAdmin.BASE_URL,
          receiveTimeout: Duration(seconds: 5),
          connectTimeout: Duration(seconds: 5),
          headers: headers);

      _dio.options = options;
      Response response = await _dio.post(url!,
          data: dictData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) => true,
            headers: headers,
          ));

      Utils.printLog("Response: $response");

      if (response.statusCode == 401) {
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        prefs.remove('userId');
        prefs.remove('name');
        prefs.remove('email');
        prefs.remove('mobile');
        prefs.setBool(AppSharedPreferences.IS_Logged_In, false);
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation animation, Animation secondaryAnimation) {
              return AppOnboardingScreen();
            }, transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return new SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            }),
            (Route route) => false);
      }
      return response;
    } catch (error) {
      Utils.printLog("Exception_Main: $error");
      return null;
    }
  }

  Future<Response?> requestGetForApi(
      {required context,
      String? url,
      Map<String, dynamic>? dictParameter,
      String? token}) async {
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer $authToken",
        "Connection": "Keep-Alive",
        "Keep-Alive": "timeout=5, max=1000",
      };

      //  final prefs = await SharedPreferences.getInstance();
      // String userId = prefs.getString(AppSharedPreferences.userId) ?? "";
      //  String sessionId = prefs.getString(AppSharedPreferences.sessionId) ?? "";

      Utils.printLog("Headers: $headers");
      Utils.printLog("Url:  $url");
      Utils.printLog("Token:  $token");
      Utils.printLog("DictParameter: $dictParameter");

      BaseOptions options = BaseOptions(
          baseUrl: WebApiConstantSuperAdmin.BASE_URL,
          receiveTimeout: Duration(minutes: 1),
          connectTimeout: Duration(minutes: 1),
          headers: headers,
          validateStatus: (_) => true);

      _dio.options = options;
      Response response = await _dio.get(url!, queryParameters: dictParameter);
      Utils.printLog("Response_headers: ${response.headers}");
      Utils.printLog("Response_data: ${response.data}");

      checkTokenStatus(response1: response.toString());

      return response;
    } catch (error) {
      Utils.printLog("Exception_Main: $error");
      return null;
    }
  }

  Future<Response?> requestMultipartApi(
      {required context,
      String? url,
      Map<String, dynamic>? dictParameter,
      String? token}) async {
    try {
      Map<String, String> headers = {
        // "Content-type": "application/json",
        // "Authkey": WebApiConstantAdmin.AUTH_KEY,
        "Authorization": "Bearer $token",
        "Connection": "Keep-Alive",
        "Keep-Alive": "timeout=5, max=1000"
      };

      var formData = FormData.fromMap(dictParameter!);

      Utils.printLog("Headers: $headers");
      Utils.printLog("Url:  $url");
      Utils.printLog("Token:  $token");
      Utils.printLog("formData: ${formData.fields.toString()}");

      BaseOptions options = BaseOptions(
          baseUrl: WebApiConstantSuperAdmin.BASE_URL,
          receiveTimeout: Duration(minutes: 1),
          connectTimeout: Duration(minutes: 1),
          headers: headers);

      _dio.options = options;
      Response response = await _dio.post(url!,
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) => true,
            headers: headers,
          ));

      Utils.printLog("Response: $response");
      if (response.statusCode == 401) {
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        prefs.remove('userId');
        prefs.remove('name');
        prefs.remove('email');
        prefs.remove('mobile');
        prefs.setBool(AppSharedPreferences.IS_Logged_In, false);
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation animation, Animation secondaryAnimation) {
              return AppOnboardingScreen();
            }, transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return new SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            }),
            (Route route) => false);
      }

      checkTokenStatus(
          response1: response.toString(), statusCode: response.statusCode);

      return response;
    } catch (error) {
      Utils.printLog("Exception_Main: $error");
      return null;
    }
  }

  ///Check Token Status
  Future<void> checkTokenStatus({required String response1, statusCode}) async {
    bool isTokenExpired =
        response1.toString().contains("Expired token") || statusCode == 401;
    if (isTokenExpired) {
      SharedPreferences.getInstance().then((value) {
        value.clear();
        ToastCustom.showToastWithLength(
            msg: "You need to login back to use app",
            toastLength: Toast.LENGTH_LONG);
        Utils.printLog("Token expired redirecting to login page ::::::::");

        G.Get.deleteAll();
      });
    }
  }
}

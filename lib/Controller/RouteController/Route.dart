import 'package:spinwheel/adminviews/admin_amountSetup_screen.dart';
import 'package:spinwheel/adminviews/admin_bankDetails_screen.dart';
import 'package:spinwheel/adminviews/admin_rechargeHistory_screen.dart';
import 'package:spinwheel/adminviews/admin_usermanagement_screen.dart';
import 'package:spinwheel/adminviews/admin_widthdrawalHistory_screen.dart';
import 'package:flutter/material.dart';

import '../../ColorPrediction/color_prediction_home_screen.dart';
import '../../LudoGame/LudoHomeScreen.dart';
import '../../Spinner/gameScreen.dart';
import '../../Spinner/spinner_onboarding_screen.dart';
import '../../adminviews/admin_dashboard_screen.dart';
import '../../common/app_home_screen.dart';
import 'RouteNames.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    ///Onboarding
    case onboardingScreen:
      return MaterialPageRoute(builder: (context) => AppOnBoardingScreen());

    // ///Game screen
    // case gameScreen:
    //   return MaterialPageRoute(builder: (context) => GameScreenMain());

    /****************************************************************** Admin codes *********************************************/

    ///Game screen
    case adminDashboardScreen:
      return MaterialPageRoute(builder: (context) => AdminDashboardScreeen());

    ///Game screen
    case adminuserManagementScreen:
      return MaterialPageRoute(
          builder: (context) => AdminUserManagementScreen());

    ///Game screen
    case adminrechargeHistoryScreen:
      return MaterialPageRoute(
          builder: (context) => AdminRechargeHistoryScreen());

    ///Game screen
    case adminwithdrawalHistoryScreen:
      return MaterialPageRoute(
          builder: (context) => AdminWidthdrawalHistoryScreen());

    ///Game screen
    case adminamountSetupScreen:
      return MaterialPageRoute(builder: (context) => AdminAmountSetupScreen());

    ///Game screen
    case adminbankDetailsScreen:
      return MaterialPageRoute(builder: (context) => AdminBankDetailsScreen());
    /****************************************************************** spinner routes *********************************************/

    ///Game screen
    case spinnerHomeScreen:
      return MaterialPageRoute(builder: (context) => SpinnerHomeScreen());

    /****************************************************************** Ludo Game routes *********************************************/
    case ludoGameHomeScreen:
      return MaterialPageRoute(builder: (context) => LudoHomeScreen());

    /******************************************************************colorPredictionGameroutes *********************************************/
    case colorPredictionGame:
      return MaterialPageRoute(
          builder: (context) => ColorPredictionHomeScreen());
    default:
      return MaterialPageRoute(builder: (context) => SpinnerOnboardingScreen());
  }
}

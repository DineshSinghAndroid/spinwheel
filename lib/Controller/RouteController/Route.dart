import 'package:spinwheel/GamesViews/LudoOffline/boardUI/main_screen.dart';
import 'package:spinwheel/adminviews/admin_amountSetup_screen.dart';
import 'package:spinwheel/adminviews/admin_bankDetails_screen.dart';
import 'package:spinwheel/adminviews/admin_rechargeHistory_screen.dart';
import 'package:spinwheel/adminviews/admin_usermanagement_screen.dart';
import 'package:spinwheel/adminviews/admin_widthdrawalHistory_screen.dart';
import 'package:flutter/material.dart';

import '../../GamesViews/ColorPrediction/ColorBet_screen.dart';
import '../../GamesViews/ColorPrediction/color_prediction_home_screen.dart';
import '../../GamesViews/JackpotGame/jackpot_game_screen.dart';
import '../../GamesViews/LudoOffline/ludo_ui/LudoOfflineBottomNavigationBarScreen/ludo_offline_bottom_bar_screen.dart';
import '../../GamesViews/Spinner/spinner_gameScreen.dart';
import '../../CommonScreens/Onboarding/app_onboarding_screen.dart';
import '../../adminviews/admin_dashboard_screen.dart';
import '../../CommonScreens/homeScreen/app_home_screen.dart';
import 'RouteNames.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    ///Onboarding
    case onboardingScreen:
      return MaterialPageRoute(builder: (context) => AppOnboardingScreen());
    case apphomeScreen:
      return MaterialPageRoute(builder: (context) => AppHomeScreen());

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
      return MaterialPageRoute(
          builder: (context) => LudoOfflineBottomNavBarScreen());
    /******************************************************************Jackpot Game routes *********************************************/
    case jackpotGameScreen:
      return MaterialPageRoute(builder: (context) => JackpotGameScreen());

    /******************************************************************colorPredictionGameroutes *********************************************/
    case colorPredictionGame:
      return MaterialPageRoute(
          builder: (context) => ColorPredictionHomeScreen());
    /******************************************************************ludo Offline   Gameroutes *********************************************/
    case ludoOfflineGameOnboardingScreen:
      return MaterialPageRoute(
          builder: (context) => LudoOfflineBottomNavBarScreen());

    /*************************************************************** color Prediction *********************************************************/

    case ColorPredictionScreenroute:
      return MaterialPageRoute(builder: (context) => ColorBetScreen());

    // case loginScreenroute:
    //   return MaterialPageRoute(
    //       builder: (context) => RegisterScreen());

    default:
      return MaterialPageRoute(builder: (context) => AppOnboardingScreen());
  }
}

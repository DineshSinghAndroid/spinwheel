import 'package:spinwheel/Controller/RouteController/RouteNames.dart';
import 'package:get/get.dart';

class AdminDrawerController extends GetxController {
  void onTapDashboard() {
    Get.offAllNamed(adminDashboardScreen);

    print("On Tap");
  }

  void onTapBankDetails() {
    Get.offAllNamed(adminbankDetailsScreen);
  }

  void onTapAmountSetup() {
    Get.offAllNamed(adminamountSetupScreen);
  }

  void onTapUserWidthrawalHistory() {
    Get.offAllNamed(adminwithdrawalHistoryScreen);
  }

  void onTapRechargeHistory() {
    Get.offAllNamed(adminrechargeHistoryScreen);
  }

  void onTapUserManagement() {
    Get.offAllNamed(adminuserManagementScreen);
  }

  void onTapLogout() {
    Get.offAllNamed(onboardingScreen);
  }
}

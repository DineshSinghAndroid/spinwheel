class WebApiConstantAdmin {
  static const String BASE_URL = "https://clientadmin.mobify.shop/wp-json/v1/";

  /// Public
  static const String registerUrl = "${BASE_URL}customer/register";
  static const String loginUrl = "${BASE_URL}customer/sign_in";
  static const String GET_PROFILE_DATA = "customer/currentuserinfo";

}

///GAMES

class WebApiConstantGames {
  static const String BASE_URL = "https://mamaludo.com";

 }

///Super admin
class WebApiConstantSuperAdmin {
  static const String BASE_URL = "https://mobify.shop";
  static const String GET_HOME_DATA_URL = "${BASE_URL}/wp-json/v1/app/get_home_data";
}

class WebApiConstantAdmin {
  static const String BASE_URL = "https://clientadmin.mobify.shop/wp-json/v1/";

  /// Public
  static const String registerUrl = "${BASE_URL}customer/register";
  static const String loginUrl = "${BASE_URL}customer/sign_in";
  static const String GET_PROFILE_DATA = "${BASE_URL}customer/currentuserinfo";
  static const String UPDATE_PROFILE_DATA =
      "${BASE_URL}customer/update_userinfo";
}

///GAMES

class WebApiConstantGames {
  static const String BASE_URL = "https://mamaludo.com/";
  static const String CREATE_LUDO_GAME = "${BASE_URL}gameapis/creatematch";
  static const String USER_CREATED_MATCHES_API = "${BASE_URL}gameapis/loadmatches";
  static const String GET_OPEN_MATCHES_LIST = "${BASE_URL}gameapis/loadopenmatches";
  static const String CANCEL_USER_CREATED_MATCH_API = "${BASE_URL}gameapis/cancelmatch";
  static const String JOIN_OPEN_MATCHES_API = "${BASE_URL}gameapis/joinmatch";
}

///Super admin
class WebApiConstantSuperAdmin {
  static const String BASE_URL = "https://mobify.shop";
  static const String GET_HOME_DATA_URL =
      "${BASE_URL}/wp-json/v1/app/get_home_data";
}

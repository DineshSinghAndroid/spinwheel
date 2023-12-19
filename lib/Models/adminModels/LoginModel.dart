class LoginModel {
  bool? authenticated;
  bool? error;
  bool? loginVerification;
  String? message;
  LoginData? data;

  LoginModel(
      {this.authenticated,
        this.error,
        this.loginVerification,
        this.message,
        this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    authenticated = json['authenticated'];
    error = json['error'];
    loginVerification = json['login_verification'];
    message = json['message'];
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authenticated'] = this.authenticated;
    data['error'] = this.error;
    data['login_verification'] = this.loginVerification;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginData {
  String ? cookie;
  String ? cookieAdmin;
  String ? cookieName;
  String ? userId;
  String ? username;
  String ? phone;
  String ? nickname;
  String ? email;
  String ? registered;
  String ? displayname;

  LoginData(
      {this.cookie,
        this.cookieAdmin,
        this.cookieName,
        this.userId,
        this.username,
        this.phone,
        this.nickname,
        this.email,
        this.registered,
        this.displayname});

  LoginData.fromJson(Map<String, dynamic> json) {
    cookie = json['cookie'] != null ? json['cookie'].toString():null ;
    cookieAdmin = json['cookie_admin'] != null ? json['cookie_admin'].toString():null ;
    cookieName = json['cookie_name'] != null ? json['cookie_name'].toString():null ;
    userId = json['user_id'] != null ? json['user_id'].toString():null ;
    username = json['username'] != null ? json['username'].toString():null ;
    phone = json['phone'] != null ? json['phone'].toString():null ;
    nickname = json['nickname'] != null ? json['nickname'].toString():null ;
    email = json['email'] != null ? json['email'].toString():null ;
    registered = json['registered'] != null ? json['registered'].toString():null ;
    displayname = json['displayname'] != null ? json['displayname'].toString():null ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cookie'] = this.cookie;
    data['cookie_admin'] = this.cookieAdmin;
    data['cookie_name'] = this.cookieName;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['nickname'] = this.nickname;
    data['email'] = this.email;
    data['registered'] = this.registered;
    data['displayname'] = this.displayname;
    return data;
  }
}

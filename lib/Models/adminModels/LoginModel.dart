class LoginModel {
  bool? authenticated;
  bool? error;
  bool? loginVerification;
  String? message;
  Data? data;

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
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  String? cookie;
  String? cookieAdmin;
  String? cookieName;
  String? userId;
  String? username;
  String? phone;
  String? nicename;
  String? email;
  String? url;
  String? registered;
  String? displayname;
  String? firstname;
  String? lastname;
  String? nickname;
  String? description;
  Capabilities? capabilities;

  Data(
      {this.cookie,
      this.cookieAdmin,
      this.cookieName,
      this.userId,
      this.username,
      this.phone,
      this.nicename,
      this.email,
      this.url,
      this.registered,
      this.displayname,
      this.firstname,
      this.lastname,
      this.nickname,
      this.description,
      this.capabilities});

  Data.fromJson(Map<String, dynamic> json) {
    cookie = json['cookie'] != null ? json['cookie'].toString() : null;
    cookieAdmin =
        json['cookie_admin'] != null ? json['cookie_admin'].toString() : null;
    cookieName =
        json['cookie_name'] != null ? json['cookie_name'].toString() : null;
    userId = json['user_id'] != null ? json['user_id'].toString() : null;
    username = json['username'] != null ? json['username'].toString() : null;
    phone = json['phone'] != null ? json['phone'].toString() : null;
    nicename = json['nicename'] != null ? json['nicename'].toString() : null;
    email = json['email'] != null ? json['email'].toString() : null;
    url = json['url'] != null ? json['url'].toString() : null;
    registered =
        json['registered'] != null ? json['registered'].toString() : null;
    displayname =
        json['displayname'] != null ? json['displayname'].toString() : null;
    firstname = json['firstname'] != null ? json['firstname'].toString() : null;
    lastname = json['lastname'] != null ? json['lastname'].toString() : null;
    nickname = json['nickname'] != null ? json['nickname'].toString() : null;
    description =
        json['description'] != null ? json['description'].toString() : null;
    capabilities = json['capabilities'] != null
        ? new Capabilities.fromJson(json['capabilities'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cookie'] = this.cookie;
    data['cookie_admin'] = this.cookieAdmin;
    data['cookie_name'] = this.cookieName;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['nicename'] = this.nicename;
    data['email'] = this.email;
    data['url'] = this.url;
    data['registered'] = this.registered;
    data['displayname'] = this.displayname;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['nickname'] = this.nickname;
    data['description'] = this.description;
    if (this.capabilities != null) {
      data['capabilities'] = this.capabilities!.toJson();
    }
    return data;
  }
}

class Capabilities {
  bool? customer;

  Capabilities({this.customer});

  Capabilities.fromJson(Map<String, dynamic> json) {
    customer = json['customer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer'] = this.customer;
    return data;
  }
}

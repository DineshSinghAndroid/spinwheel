class RegisterModel {
  bool? authenticated;
  bool? error;
  String? message;
  Data? data;

  RegisterModel({this.authenticated, this.error, this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    authenticated = json['authenticated'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authenticated'] = this.authenticated;
    data['error'] = this.error;
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
  int? userId;
  String? username;
  String? phone;
  String? nickname;
  String? email;
  String? registered;
  String? displayname;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    cookie = json['cookie'];
    cookieAdmin = json['cookie_admin'];
    cookieName = json['cookie_name'];
    userId = json['user_id'];
    username = json['username'];
    phone = json['phone'];
    nickname = json['nickname'];
    email = json['email'];
    registered = json['registered'];
    displayname = json['displayname'];
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

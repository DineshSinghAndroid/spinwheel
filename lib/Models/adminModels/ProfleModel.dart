class ProfileDataModelHome {
  bool? authenticated;
  bool? error;
  String? message;
  Data? data;

  ProfileDataModelHome(
      {this.authenticated, this.error, this.message, this.data});

  ProfileDataModelHome.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? username;
  String? email;
  String? displayname;
  String? firstname;
  String? lastname;
  String? nickname;
  String? profileImage;

  Data(
      {this.userId,
        this.username,
        this.email,
        this.displayname,
        this.firstname,
        this.lastname,
        this.nickname,
        this.profileImage});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    displayname = json['displayname'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    nickname = json['nickname'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['displayname'] = this.displayname;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['nickname'] = this.nickname;
    data['profile_image'] = this.profileImage;
    return data;
  }
}

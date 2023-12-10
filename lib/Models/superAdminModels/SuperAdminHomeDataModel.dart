class SuperAdminHomeDataMode {
  bool? authenticated;
  bool? error;
  String? message;
  Data? data;

  SuperAdminHomeDataMode(
      {this.authenticated, this.error, this.message, this.data});

  SuperAdminHomeDataMode.fromJson(Map<String, dynamic> json) {
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
  List<AppList>? appList;
  AppInfo? appInfo;
  HomeData? homeData;

  Data({this.appList, this.appInfo, this.homeData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['app_list'] != null) {
      appList = <AppList>[];
      json['app_list'].forEach((v) {
        appList!.add(new AppList.fromJson(v));
      });
    }
    appInfo = json['app_info'] != null
        ? new AppInfo.fromJson(json['app_info'])
        : null;
    homeData = json['home_data'] != null
        ? new HomeData.fromJson(json['home_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appList != null) {
      data['app_list'] = this.appList!.map((v) => v.toJson()).toList();
    }
    if (this.appInfo != null) {
      data['app_info'] = this.appInfo!.toJson();
    }
    if (this.homeData != null) {
      data['home_data'] = this.homeData!.toJson();
    }
    return data;
  }
}

class AppList {
  String? appUrl;
  String? appImage;
  String? appStatus;

  AppList({this.appUrl, this.appImage, this.appStatus});

  AppList.fromJson(Map<String, dynamic> json) {
    appUrl = json['app_url'];
    appImage = json['app_image'];
    appStatus = json['app_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_url'] = this.appUrl;
    data['app_image'] = this.appImage;
    data['app_status'] = this.appStatus;
    return data;
  }
}

class AppInfo {
  bool? appUpdated;
  String? appVersion;
  bool? forceUpdated;

  AppInfo({this.appUpdated, this.appVersion, this.forceUpdated});

  AppInfo.fromJson(Map<String, dynamic> json) {
    appUpdated = json['app_updated'];
    appVersion = json['app_version'];
    forceUpdated = json['force_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_updated'] = this.appUpdated;
    data['app_version'] = this.appVersion;
    data['force_updated'] = this.forceUpdated;
    return data;
  }
}

class HomeData {
  List<Slider>? slider;
  String? footerText;

  HomeData({this.slider, this.footerText});

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((v) {
        slider!.add(new Slider.fromJson(v));
      });
    }
    footerText = json['footer_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slider != null) {
      data['slider'] = this.slider!.map((v) => v.toJson()).toList();
    }
    data['footer_text'] = this.footerText;
    return data;
  }
}

class Slider {
  String? url;

  Slider({this.url});

  Slider.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

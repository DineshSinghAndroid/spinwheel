class OpenMatchCancelModel {
  bool? authenticated;
  bool? error;
  String? message;
  Null? data;

  OpenMatchCancelModel(
      {this.authenticated, this.error, this.message, this.data});

  OpenMatchCancelModel.fromJson(Map<String, dynamic> json) {
    authenticated = json['authenticated'];
    error = json['error'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authenticated'] = this.authenticated;
    data['error'] = this.error;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}

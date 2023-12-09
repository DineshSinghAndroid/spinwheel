class RegisterModel {
  RegisterModel({
    required this.authenticated,
    required this.error,
    required this.message,
    required this.data,
  });

  late final bool authenticated;
  late final bool error;
  late final String message;
  late final List<dynamic> data;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    authenticated = json['authenticated'];
    error = json['error'];
    message = json['message'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['authenticated'] = authenticated;
    _data['error'] = error;
    _data['message'] = message;
    _data['data'] = data;
    return _data;
  }
}

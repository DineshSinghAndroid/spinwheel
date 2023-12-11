class CreateLudoGameModel {
  bool? authenticated;
  bool? error;
  String? message;
  Data? data;

  CreateLudoGameModel(
      {this.authenticated, this.error, this.message, this.data});

  CreateLudoGameModel.fromJson(Map<String, dynamic> json) {
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
  String? hostId;
  String? amount;
  String? game;
  String? status;
  String? createdAt;
  String? id;

  Data(
      {this.hostId,
      this.amount,
      this.game,
      this.status,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    hostId = json['host_id'] != null ? json['host_id'].toString() : null;
    amount = json['amount'] != null ? json['amount'].toString() : null;
    game = json['game'] != null ? json['game'].toString() : null;
    status = json['status'] != null ? json['status'].toString() : null;
    createdAt =
        json['created_at'] != null ? json['created_at'].toString() : null;
    id = json['id'] != null ? json['id'].toString() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['host_id'] = this.hostId;
    data['amount'] = this.amount;
    data['game'] = this.game;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

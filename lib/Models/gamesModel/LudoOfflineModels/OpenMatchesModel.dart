class OpenMatchesModel {
  bool? authenticated;
  bool? error;
  String? message;
  List<Data>? data;

  OpenMatchesModel({this.authenticated, this.error, this.message, this.data});

  OpenMatchesModel.fromJson(Map<String, dynamic> json) {
    authenticated = json['authenticated'];
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authenticated'] = this.authenticated;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? status;
  String? roomCode;
  String? winner;
  String? winnerScreenshot;
  String? looserScreenshot;
  String? looser;
  String? hostId;
  String? joinerId;
  String? winnerTime;
  String? looserTime;
  String? id;
  String? amount;
  String? createdAt;
  String? game;

  Data(
      {this.status,
        this.roomCode,
        this.winner,
        this.winnerScreenshot,
        this.looserScreenshot,
        this.looser,
        this.hostId,
        this.joinerId,
        this.winnerTime,
        this.looserTime,
        this.id,
        this.amount,
        this.createdAt,
        this.game});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    roomCode = json['room_code'];
    winner = json['winner'];
    winnerScreenshot = json['winner_screenshot'];
    looserScreenshot = json['looser_screenshot'];
    looser = json['looser'];
    hostId = json['host_id'];
    joinerId = json['joiner_id'];
    winnerTime = json['winner_time'];
    looserTime = json['looser_time'];
    id = json['id'];
    amount = json['amount'];
    createdAt = json['created_at'];
    game = json['game'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['room_code'] = this.roomCode;
    data['winner'] = this.winner;
    data['winner_screenshot'] = this.winnerScreenshot;
    data['looser_screenshot'] = this.looserScreenshot;
    data['looser'] = this.looser;
    data['host_id'] = this.hostId;
    data['joiner_id'] = this.joinerId;
    data['winner_time'] = this.winnerTime;
    data['looser_time'] = this.looserTime;
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['created_at'] = this.createdAt;
    data['game'] = this.game;
    return data;
  }
}

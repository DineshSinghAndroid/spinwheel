class UserCreatedMatchModel {
  bool? authenticated;
  bool? error;
  String? message;
  Data? data;

  UserCreatedMatchModel(
      {this.authenticated, this.error, this.message, this.data});

  UserCreatedMatchModel.fromJson(Map<String, dynamic> json) {
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
  Host? host;
  Host? join;

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
        this.game,
        this.host,
        this.join});

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
    host = json['host'] != null ? new Host.fromJson(json['host']) : null;
    join = json['join'] != null ? new Host.fromJson(json['join']) : null;
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
    if (this.host != null) {
      data['host'] = this.host!.toJson();
    }
    if (this.join != null) {
      data['join'] = this.join!.toJson();
    }
    return data;
  }
}

class Host {
  String? name;
  String? username;

  Host({this.name, this.username});

  Host.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    return data;
  }
}

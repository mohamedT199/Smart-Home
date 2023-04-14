class Attacks {
  int? id;
  String? message;
  bool? state;
  String? date;
  String? time;
  int? userId;

  Attacks(
      {this.id, this.message, this.state, this.date, this.time, this.userId});

  Attacks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    state = json['state'];
    date = json['date'];
    time = json['time'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['state'] = this.state;
    data['date'] = this.date;
    data['time'] = this.time;
    data['user_id'] = this.userId;
    return data;
  }
}
class Attacks {
  int? id;
  String? message;
  int? state;
  String? date;
  String? time;
  int? userId;

  Attacks(
      {this.id, this.message, this.state, this.date, this.time, this.userId});

  Attacks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    print("================================");
    message = json['message'];
    print("================================");
    state = json['state'];
    print("================================");
    date = json['date'];
    print("================================");
    time = json['time'];
    print("================================");
    userId = json['user_id'];
    print("================================");
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
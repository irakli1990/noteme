class Task {
  int id;
  String name;
  String addTime;
  String rememberTime;
  int status;
  int priority;

  Task({this.id, this.name, this.addTime, this.rememberTime, this.priority,this.status});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    addTime = json['addtime'];
    rememberTime = json['remembertime'];
    priority = json['priority'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['addtime'] = this.addTime;
    data['remembertime'] = this.rememberTime;
    data['priority'] = this.priority;
    data['status'] = this.status;
    return data;
  }
}
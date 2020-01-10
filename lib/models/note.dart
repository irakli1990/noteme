class Note {
  int id;
  String name;
  String addTime;
  String status;


  Note({this.id, this.name, this.addTime,this.status});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    addTime = json['addtime'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['addtime'] = this.addTime;
    data['status'] = this.status;
    return data;
  }
}
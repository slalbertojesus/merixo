class Story {
  String title;
  String pic;
  String dateCreated;
  int id;

  Story({this.title, this.pic, this.dateCreated, this.id});

  Story.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    pic = json['pic'];
    dateCreated = json['date_created'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['pic'] = this.pic;
    data['date_created'] = this.dateCreated;
    data['id'] = this.id;
    return data;
  }
}
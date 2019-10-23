class GetResponse {
  String name;
  String email;
  String username;
  String estado;
  String pic;

  GetResponse({this.name, this.email, this.username, this.estado, this.pic});

  GetResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    username = json['username'];
    estado = json['estado'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['estado'] = this.estado;
    data['pic'] = this.pic;
    return data;
  }
}
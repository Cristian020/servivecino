class InfoService {
  String name;
  String lastname;
  String document;
  String telefono;
  String email;
  String direccion;

  InfoService(
      {this.name,
      this.lastname,
      this.document,
      this.telefono,
      this.email,
      this.direccion});

  InfoService.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastname = json['lastname'];
    document = json['document'];
    telefono = json['telefono'];
    email = json['email'];
    direccion = json['direccion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['document'] = this.document;
    data['telefono'] = this.telefono;
    data['email'] = this.email;
    data['direccion'] = this.direccion;
    return data;
  }
}

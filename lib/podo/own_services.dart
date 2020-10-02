class OwnService {
  String img;
  String name;

  OwnService({this.img, this.name});

  OwnService.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['name'] = this.name;
    return data;
  }
}

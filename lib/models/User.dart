class User {
  String? isim;
  String? soyisim;

  User({this.isim, this.soyisim});

  User.fromJson(Map<String, dynamic> json) {
    isim = json['isim'];
    soyisim = json['soyisim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isim'] = this.isim;
    data['soyisim'] = this.soyisim;
    return data;
  }
}
class User2 {
  String? isim;
  String? soyisim;

  User2({this.isim, this.soyisim});

  User2.fromJson(Map<String, dynamic> json) {
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
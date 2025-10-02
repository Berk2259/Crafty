class DetailMalzemeContainerModel {
  final String icon;
  final String malzeme;

  DetailMalzemeContainerModel({required this.icon, required this.malzeme});

  factory DetailMalzemeContainerModel.fromJson(Map<String, dynamic> json) {
    return DetailMalzemeContainerModel(
      icon: json['icon'],
      malzeme: json['malzeme'],
    );
  }
}


//İlk detay kısmının yapısal özellikleri burada tanımlandı
class AciklamaModel {
  final List<String> aciklama;

  AciklamaModel({required this.aciklama});

  factory AciklamaModel.fromJson(Map<String, dynamic> json) {
    return AciklamaModel(aciklama: List<String>.from(json['aciklama']));
  }
}


//Detay butonu ile gidip açıklama kısmının yapısal özellikleri burada tanımlandı
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../Models/detail_container_malzeme_model.dart';
import '../Models/aciklama_model.dart';

class FlowerDataService {
  // JSON dosyasını oku
  Future<Map<String, dynamic>> _loadJson() async {
    String jsonString = await rootBundle.loadString(
      'assets/data/flower_data.json',
    );
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return jsonData;
  }

  // Malzemeleri ve açıklamaları Dart objelerine dönüştür
  Future<Map<String, List<DetailMalzemeContainerModel>>> getMaterials() async {
    final jsonData = await _loadJson();
    return (jsonData['flowerMaterials'] as Map<String, dynamic>).map(
      (key, value) => MapEntry(
        key,
        (value as List)
            .map((item) => DetailMalzemeContainerModel.fromJson(item))
            .toList(),
      ),
    );
  }

  Future<Map<String, List<AciklamaModel>>> getAciklamalar() async {
    final jsonData = await _loadJson();
    return (jsonData['flowerAciklamalar'] as Map<String, dynamic>).map(
      (key, value) => MapEntry(
        key,
        (value as List).map((item) => AciklamaModel.fromJson(item)).toList(),
      ),
    );
  }
}

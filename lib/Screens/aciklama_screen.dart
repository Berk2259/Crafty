import 'package:crafty/Widget/widget.dart';
import 'package:crafty/Models/aciklama_model.dart';
import 'package:crafty/services/flower_data_service.dart';
import 'package:flutter/material.dart';

class AciklamaScreen extends StatelessWidget {
  final String flowerType;
  final FlowerDataService flowerDataService = FlowerDataService();

  AciklamaScreen({super.key, required this.flowerType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      appBar: AppbarWidget(
        text: '$flowerType Detayı',
        colorText: Colors.white,
        colorBar: Colors.deepPurple.shade900,
        iconColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Colors.deepPurple.shade300,
        ),
        child: FutureBuilder<Map<String, List<AciklamaModel>>>(
          future: flowerDataService.getAciklamalar(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            final aciklamalar = snapshot.data?[flowerType] ?? [];
            return ListView.builder(
              padding: EdgeInsets.only(top: 16.0),
              itemCount: aciklamalar.length,
              itemBuilder: (context, index) {
                final aciklamaModel = aciklamalar[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Adım ${index + 1}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 81, 76, 100),
                          ),
                        ),
                        SizedBox(height: 8),
                        ...aciklamaModel.aciklama
                            .map(
                              (aciklama) => Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Text(
                                  '• $aciklama',
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.5,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

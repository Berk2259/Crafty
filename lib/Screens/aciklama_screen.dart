import 'package:crafty/Widget/widget.dart';
import 'package:crafty/Models/detail_data.dart';
import 'package:flutter/material.dart';

class AciklamaScreen extends StatelessWidget {
  final String flowerType;
  const AciklamaScreen({super.key, required this.flowerType});

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
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 16.0),
                itemCount:
                    DetailData.flowerAciklamalar[flowerType]?.length ?? 0,
                itemBuilder: (context, index) {
                  final aciklamalar = DetailData.flowerAciklamalar[flowerType];
                  if (aciklamalar == null || aciklamalar.isEmpty) {
                    return Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'Açıklama bulunamadı.',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }
                  final aciklamaModel = aciklamalar[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
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
                            color: Colors.deepPurple.shade900,
                          ),
                        ),
                        SizedBox(height: 8),
                        if (aciklamaModel.aciklama != null)
                          ...aciklamaModel.aciklama!
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

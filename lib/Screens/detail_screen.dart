import 'package:crafty/Models/model.dart';
import 'package:crafty/Containers/container.dart';
import 'package:crafty/Services/services.dart';
import 'package:crafty/Widget/widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String detailBaslik;
  final FlowerDataService flowerDataService = FlowerDataService();
  DetailScreen({super.key, required this.detailBaslik});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      appBar: AppbarWidget(
        text: detailBaslik,
        colorText: Colors.white,
        colorBar: Colors.deepPurple.shade900,
        iconColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
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
              child:
                  FutureBuilder<Map<String, List<DetailMalzemeContainerModel>>>(
                    future: flowerDataService.getMaterials(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final materials = snapshot.data![detailBaslik]!;
                      return ListView.builder(
                        padding: EdgeInsets.only(top: 16.0),
                        itemCount: materials.length,
                        itemBuilder: (context, index) {
                          return DetailMalzemeContainer(
                            detailMalzemeContainerModel: materials[index],
                          );
                        },
                      );
                    },
                  ),
            ),
            DetayButtonWidget(detailBaslik: detailBaslik),
          ],
        ),
      ),
    );
  }
}

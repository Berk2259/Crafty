import 'package:crafty/Models/model.dart';
import 'package:crafty/Models/detail_data.dart';
import 'package:crafty/Containers/container.dart';
import 'package:crafty/Screens/screen.dart';
import 'package:crafty/Widget/widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String detailBaslik;
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
              child: ListView.builder(
                padding: EdgeInsets.only(top: 16.0),
                itemCount:
                    DetailData.flowerMaterials[detailBaslik]?.length ?? 0,
                itemBuilder: (context, index) {
                  final materials = DetailData.flowerMaterials[detailBaslik];
                  if (materials == null) return SizedBox.shrink();
                  return DetailMalzemeContainer(
                    detailMalzemeContainerModel: materials[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AciklamaScreen()),
                  );
                },
                child: Text('Detay'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

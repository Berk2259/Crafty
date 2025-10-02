import 'package:crafty/Screens/screen.dart';
import 'package:flutter/material.dart';

//Detay Butonu burada tanımlandı
class DetayButtonWidget extends StatelessWidget {
  final String detailBaslik;
  const DetayButtonWidget({super.key, required this.detailBaslik});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AciklamaScreen(flowerType: detailBaslik),
            ),
          );
        },
        child: Text('Detay'),
        style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
      ),
    );
  }
}

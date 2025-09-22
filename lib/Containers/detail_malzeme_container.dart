import 'package:crafty/Models/model.dart';
import 'package:flutter/material.dart';

//Detay sayfasındaki malzemelerin container yapısı burada tanımlandı

class DetailMalzemeContainer extends StatelessWidget {
  DetailMalzemeContainerModel detailMalzemeContainerModel;
  DetailMalzemeContainer({required this.detailMalzemeContainerModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Image.asset(detailMalzemeContainerModel.icon),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(detailMalzemeContainerModel.malzeme),
            ),
          ],
        ),
      ),
    );
  }
}

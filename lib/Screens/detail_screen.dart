import 'package:crafty/Models/model.dart';
import 'package:crafty/Containers/container.dart';
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
      body: Column(
        children: [
          Expanded(
            child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailMalzemeContainer(
                    detailMalzemeContainerModel: DetailMalzemeContainerModel(
                      icon: 'assets/images/makas.png',
                      malzeme: 'Makas',
                    ),
                  ),
                  DetailMalzemeContainer(
                    detailMalzemeContainerModel: DetailMalzemeContainerModel(
                      icon: 'assets/images/makas.png',
                      malzeme: 'Makas',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

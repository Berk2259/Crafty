import 'package:crafty/Containers/container.dart';
import 'package:crafty/Models/model.dart';
import 'package:crafty/Widget/widget.dart';
import 'package:flutter/material.dart';

//Ana Sayfa kısmı burada
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppbarWidget(
        text: 'Ana Sayfa',
        colorText: Colors.white,
        colorBar: Colors.deepPurple.shade900,
      ),
      body: Column(
        children: [
          HomeContainer(
            homeContainerModel: HomeContainerModel(
              baslik: 'Gül',
              image: 'assets/images/rose.png',
            ),
          ),
          HomeContainer(
            homeContainerModel: HomeContainerModel(
              baslik: 'Orkide',
              image: 'assets/images/orchid.png',
            ),
          ),
          HomeContainer(
            homeContainerModel: HomeContainerModel(
              baslik: 'Papatya',
              image: 'assets/images/papatya.png',
            ),
          ),
          HomeContainer(
            homeContainerModel: HomeContainerModel(
              baslik: 'Lavanta',
              image: 'assets/images/lavender.png',
            ),
          ),
        ],
      ),
    );
  }
}

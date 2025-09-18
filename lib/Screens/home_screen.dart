import 'package:crafty/Screens/screen.dart';
import 'package:crafty/Widget/appBar_widget.dart';
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
            baslik: 'Gül',
            image: 'assets/images/rose.png',

            DetailBaslik: 'Gül',
          ),
          HomeContainer(
            baslik: 'Orkide',
            image: 'assets/images/orchid.png',

            DetailBaslik: 'Orkide',
          ),
        ],
      ),
    );
  }
}

class HomeContainer extends StatelessWidget {
  final String baslik;
  final String image;
  final String DetailBaslik;
  const HomeContainer({
    super.key,
    required this.baslik,
    required this.image,
    required this.DetailBaslik,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(image),
                backgroundColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                baslik,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => DetailScreen(detailBaslik: DetailBaslik),
                  ),
                );
              },
              icon: Icon(Icons.arrow_circle_right, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:crafty/Models/model.dart';
import 'package:crafty/Screens/screen.dart';
import 'package:flutter/material.dart';

// Bu kısım ana sayfadaki çiçeklerin container yapısını tanımlıyor
class HomeContainer extends StatelessWidget {
  HomeContainerModel homeContainerModel;

  HomeContainer({required this.homeContainerModel});

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
                backgroundImage: AssetImage(homeContainerModel.image),
                backgroundColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                homeContainerModel.baslik,
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
                        (context) => DetailScreen(
                          detailBaslik: homeContainerModel.baslik,
                        ),
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

import 'package:crafty/Widget/appBar_widget.dart';
import 'package:flutter/material.dart';

//Profil kısmı burada
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppbarWidget(
        text: 'Profil Sayfası',
        colorText: Colors.white,
        colorBar: Colors.deepPurple.shade900,
      ),
    );
  }
}

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
    );
  }
}

import 'package:crafty/Screens/screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

//Sayfa geçişleri ve curvedBar burada
class _MainScreenState extends State<MainScreen> {
  final List<Widget> pages = [HomeScreen(), ProfileScreen()];
  final List<Widget> icons = [
    Image.asset('assets/images/home.png'),
    Image.asset('assets/images/profile.png'),
  ];
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        items: icons,
        index: _page,
        color: Colors.deepPurple.shade900,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        height: 65,
        onTap:
            (value) => setState(() {
              _page = value;
            }),
      ),
    );
  }
}

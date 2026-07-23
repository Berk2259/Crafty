import 'package:crafty/Screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  final List<Widget> screens = [HomeScreen(), FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(18, 0, 18, 18),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xff1C1C1E),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25,
                  offset: Offset(0, 30),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomBarItem(
                  icon1: Iconsax.home_2,
                  icon2: Iconsax.home_2_copy,
                  selected: currentIndex == 0,
                  text: 'Ana Sayfa',
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                ),
                BottomBarItem(
                  icon1: Iconsax.heart,
                  icon2: Iconsax.heart_copy,
                  selected: currentIndex == 1,
                  text: 'Favoriler',
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final IconData icon1;
   final IconData icon2;
  final String text;
  final bool selected;
  final VoidCallback onTap;
  const BottomBarItem({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.selected,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            selected ? icon1 : icon2,
            color: selected ? Colors.purple : Colors.white,
            size: selected ? 30 : 25,
          ),
          Text(
            text,
            style: TextStyle(color: selected ? Colors.purple : Colors.white,
            fontSize: selected ? 12 : 10),
          ),
        ],
      ),
    );
  }
}

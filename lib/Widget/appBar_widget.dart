import 'package:flutter/material.dart';

//AppBar kısmı burada tanımlandı
class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Color colorText;
  final Color colorBar;
  const AppbarWidget({
    super.key,
    required this.text,
    required this.colorText,
    required this.colorBar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(text, style: TextStyle(color: colorText)),
      backgroundColor: colorBar,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

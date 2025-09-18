import 'package:flutter/material.dart';

//AppBar kısmı burada tanımlandı
class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Color colorText;
  final Color colorBar;
  final Color? iconColor;
  const AppbarWidget({
    super.key,
    required this.text,
    required this.colorText,
    required this.colorBar,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(text, style: TextStyle(color: colorText)),
      backgroundColor: colorBar,
      iconTheme: IconThemeData(color: iconColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

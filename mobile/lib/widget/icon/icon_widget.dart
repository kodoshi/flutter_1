import 'package:flutter/material.dart';

/// custom icon builder used in the ProfilePage
class IconWidget extends StatelessWidget {
  final IconData? icon;
  final Color? color;

  const IconWidget({Key? key, this.icon, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:color,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}

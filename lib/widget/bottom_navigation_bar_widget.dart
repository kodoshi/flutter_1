import 'package:flutter/material.dart';
import 'dart:math' as math;

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Transform(
              transform: Matrix4.rotationY(math.pi),
              child: Icon(Icons.mode_night)),
          label: 'Song'),
    ]);
  }
}

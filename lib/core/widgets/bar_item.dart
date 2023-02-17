import 'package:flutter/material.dart';

class BarItem extends IconButton {
  BarItem(
      {super.key,
      required VoidCallback onPressed,
      required IconData iconData,
      required bool selected,
      double size = 30})
      : super(
          icon: Icon(
            iconData,
            color: selected ? Colors.blue : Colors.grey,
            size: size,
          ),
          onPressed: onPressed,
        );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: isActive
          ? CircleAvatar(
              radius: 35,
              backgroundColor: color,
              child: Icon(
                Icons.check,
                size: 40,
                color: Colors.blueGrey[100],
              ),
            )
          : CircleAvatar(
              backgroundColor: color,
            ),
    );
  }
}

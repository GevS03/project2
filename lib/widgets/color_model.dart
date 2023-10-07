import 'package:flutter/material.dart';

class ItemColor extends StatelessWidget {
  const ItemColor({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: color,
    );
  }
}
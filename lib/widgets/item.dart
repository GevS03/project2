import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item(
      {super.key,
      required this.width,
      required this.height,
      this.topLeftR = 0,
      this.topRightR = 0,
      this.bottomLeftR = 0,
      this.bottomRightR = 0,
      this.color = Colors.blue,
      this.margin = 0,
    });

  final double height;
  final double width;
  final double topLeftR;
  final double topRightR;
  final double bottomLeftR;
  final double bottomRightR;
  final Color color;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftR),
              topRight: Radius.circular(topRightR),
              bottomLeft: Radius.circular(bottomLeftR),
              bottomRight: Radius.circular(bottomRightR))),
    );
  }
}

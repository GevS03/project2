import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    this.width = 0,
    this.height = 0,
    this.topLeftR = 0,
    this.topRightR = 0,
    this.bottomLeftR = 0,
    this.bottomRightR = 0,
    this.color = Colors.white,
  });

  final double height;
  final double width;
  final double topLeftR;
  final double topRightR;
  final double bottomLeftR;
  final double bottomRightR;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
              color: Colors.black, width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftR),
              topRight: Radius.circular(topRightR),
              bottomLeft: Radius.circular(bottomLeftR),
              bottomRight: Radius.circular(bottomRightR))),
    );
  }
}
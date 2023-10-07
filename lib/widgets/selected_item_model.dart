import 'package:flutter/material.dart';
import 'package:project2/widgets/item_model.dart';


class SelectedItem extends StatelessWidget {
  const SelectedItem({
    super.key,
    this.color = Colors.white,
    required this.item
  });

  final Color color;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Item(
      width: item.width,
      height: item.height,
      topLeftR: item.topLeftR,
      topRightR: item.topRightR,
      bottomLeftR: item.bottomLeftR,
      bottomRightR: item.bottomRightR,
      color: color,
    );
  }
}

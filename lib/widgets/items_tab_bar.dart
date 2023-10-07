import 'package:flutter/material.dart';
import 'package:project2/widgets/items.dart';

class ItemsTabBar extends StatelessWidget {
  const ItemsTabBar({super.key, required this.onTap});

  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
                length: items.length,
                child: TabBar(
                  indicatorPadding: const EdgeInsets.only(top: 82),
                  indicatorWeight: 10,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  labelPadding: const EdgeInsets.all(10),
                  isScrollable: true,
                  onTap: onTap,
                  tabs: [...items.map((item) => item)],
                ));
  }
}
import 'package:flutter/material.dart';
import 'package:project2/colors.dart';

class ColorsTabBar extends StatelessWidget {
  const ColorsTabBar({super.key, required this.onTap});

  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
                length: colors.length,
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
                  tabs: [...colors.map((color) => color)],
                ));
  }
}
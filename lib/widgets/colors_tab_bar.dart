import 'package:flutter/material.dart';
import 'package:project2/colors.dart';
import 'package:project2/item_bloc/bloc/item_bloc.dart';

class ColorsTabBar extends StatelessWidget {
  const ColorsTabBar({
    super.key,
    required this.itemBloc,
  });

  final ItemBloc itemBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.grey,
      child: DefaultTabController(
          length: colors.length,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.only(top: 94),
            isScrollable: true,
            indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            onTap: (value) {
              itemBloc.add(ItemAddColorEvent(color: colors[value].color));
            },
            tabs: colors,
          )),
    );
  }
}

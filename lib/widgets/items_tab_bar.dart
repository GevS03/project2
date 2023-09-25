import 'package:flutter/material.dart';
import 'package:project2/item_bloc/bloc/item_bloc.dart';
import 'package:project2/items.dart';

class ItemsTabBar extends StatelessWidget {
  const ItemsTabBar({
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
          length: items.length,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.only(top: 94),
            isScrollable: true,
            indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            onTap: (value) {
              itemBloc.add(ItemAddItemEvent(item: items[value]));
            },
            tabs: items,
          )),
    );
  }
}
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/item.dart';
import 'package:project2/item_bloc/bloc/item_bloc.dart';
import 'package:project2/item_color.dart';

class IconRow extends StatefulWidget {
  const IconRow({super.key});

  @override
  State<IconRow> createState() => _IconRowState();
}

class _IconRowState extends State<IconRow> {
  final List<Item> items = [
    Item(width: 60, height: 60),
    Item(
      width: 60,
      height: 60,
      topLeftR: 50,
      topRightR: 50,
      bottomLeftR: 50,
      bottomRightR: 50,
    ),
    Item(
      width: 60,
      height: 60,
      topLeftR: 70,
      topRightR: 30,
      bottomLeftR: 30,
      bottomRightR: 70,
    ),
    Item(
      width: 60,
      height: 60,
      topLeftR: 30,
      topRightR: 70,
      bottomLeftR: 70,
      bottomRightR: 30,
    ),
    Item(width: 100, height: 60),
  ];

  List<Item> selectedItems = [];

  final List<ItemColor> colors = [
    ItemColor(color: Colors.red),
    ItemColor(color: Colors.blue),
    ItemColor(color: Colors.yellow),
    ItemColor(color: Colors.orange),
    ItemColor(color: Colors.pink),
  ];

  @override
  Widget build(BuildContext context) {
    final itemBloc = ItemBloc();
    return BlocProvider(
      create: (context) => itemBloc,
      child: BlocBuilder<ItemBloc, ItemState>(
        bloc: itemBloc,
        builder: (context, state) {
          return Column(
            children: [
              Container(
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
                        log("value __ $value");
                        itemBloc.add(ItemAddItemEvent(item: items[value]));
                      },
                      tabs: items,
                    )),
              ),
              Container(
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
                        log("value __ $value");
                        itemBloc
                            .add(ItemAddColorEvent(color: colors[value].color));
                      },
                      tabs: colors,
                    )),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedItems.add(state.item);
                    });
                  },
                  child: Text('Add')),
              Padding(padding: EdgeInsets.only(top: 30)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: selectedItems,
              )
            ],
          );
        },
      ),
    );
  }
}

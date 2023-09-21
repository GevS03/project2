import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/item_bloc/bloc/item_bloc.dart';

class IconRow extends StatefulWidget {
  const IconRow({super.key});

  @override
  State<IconRow> createState() => _IconRowState();
}

class _IconRowState extends State<IconRow> {
  @override
  Widget build(BuildContext context) {
    final itemBloc = ItemBloc();
    return BlocProvider(
      create: (context) => itemBloc,
      child: Container(
          height: 100,
          width: double.infinity,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return BlocBuilder<ItemBloc, ItemState>(
                builder: (context, state) {
                  Color itemColor = state.color;
                  return TextButton(
                    onPressed: () {
                      log('index -- $index');
                      itemBloc.add(
                          ItemMarkEvent(color: Colors.black, selected: true));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: itemColor,
                    )
                  );
                },
              );
            },
          )),
    );
  }
}

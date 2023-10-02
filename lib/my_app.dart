import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/colors.dart';
import 'package:project2/item_bloc/bloc/item_bloc.dart';
import 'package:project2/items.dart';
import 'package:project2/widgets/item.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Item> selectedItems = [];

  Item? selecteditem;
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    final itemBloc = ItemBloc();
    return Scaffold(
      backgroundColor: const Color.fromARGB(115, 158, 158, 158),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(115, 84, 84, 84),
        title: const Text('My App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: BlocProvider(
        create: (context) => itemBloc,
        child: Column(
          children: [
            DefaultTabController(
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
                  onTap: (value) {
                    selecteditem = items[value];
                  },
                  tabs: [...items.map((item) => item)],
                )),
            DefaultTabController(
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
                  onTap: (value) {
                    selectedColor = colors[value].color;
                  },
                  tabs: [...colors.map((color) => color)],
                )),
            const Padding(padding: EdgeInsets.only(top: 40)),
            ElevatedButton(
                onPressed: () {
                  if (selecteditem != null) {
                    selectedItems.add(Item(
                      width: selecteditem!.width,
                      height: selecteditem!.height,
                      topLeftR: selecteditem!.topLeftR,
                      topRightR: selecteditem!.topRightR,
                      bottomLeftR: selecteditem!.bottomLeftR,
                      bottomRightR: selecteditem!.bottomRightR,
                      color: selectedColor ?? Colors.white,
                      margin: 30,
                    ));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('Please Add Item'),
                        );
                      },
                    );
                  }

                  itemBloc.add(ItemAddEvent(selectedItems: selectedItems));
                },
                child: const Text('Add Item')),
            BlocBuilder<ItemBloc, ItemState>(
              bloc: itemBloc,
              builder: (context, state) {
                return Column(
                  children: state.selectedItems,
                );
              },
            )
          ],
        ),
      )),
    );
  }
}

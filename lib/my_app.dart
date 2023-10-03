import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/colors.dart';
import 'package:project2/item_bloc/bloc/item_bloc.dart';
import 'package:project2/items.dart';
import 'package:project2/widgets/add_button.dart';
import 'widgets/widgets_export.dart';


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
            ItemsTabBar(onTap: (int itemIndex) {
              selecteditem = items[itemIndex];
            }),
            ColorsTabBar(onTap: (int colorIndex) {
              selectedColor = colors[colorIndex].color;
            }),
            const Padding(padding: EdgeInsets.only(top: 40)),
            AddButton(onPressed: () {
              if(selecteditem != null) {
                itemBloc.add(ItemAddEvent(selectedItems: selectedItems, selectedItem: Item(
                  width: selecteditem!.width,
                  height: selecteditem!.height,
                  topLeftR: selecteditem!.topLeftR,
                  topRightR: selecteditem!.topRightR,
                  bottomLeftR: selecteditem!.bottomLeftR,
                  bottomRightR: selecteditem!.bottomRightR,
                  color: selectedColor ?? Colors.white,
                  margin: 30,
                )));
              }else {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    content: Text('Please Add Item'),
                  );
                });
              }
              
                  
            }),
            SelectedItemsColumn(itemBloc: itemBloc)
          ],
        ),
      )),
    );
  }
}

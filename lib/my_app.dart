import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/item_bloc/bloc/item_bloc.dart';
import 'widgets/widgets_export.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ItemBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = ItemBloc();
  }

  Item? selecteditem;
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(115, 158, 158, 158),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(115, 84, 84, 84),
        title: const Text('My App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: BlocProvider(
        create: (context) => bloc,
        child: Column(
          children: [
            ItemsTabBar(onTap: (int itemIndex) {
              setState(() {
                selecteditem = items[itemIndex];
              });
            }),
            ColorsTabBar(onTap: (int colorIndex) {
              setState(() {
                selectedColor = colors[colorIndex].color;
              });
            }),
            const Padding(padding: EdgeInsets.only(top: 40)),
            AddButton(onPressed: () {
              bloc.add(ItemAddEvent(selectedItem: SelectedItem(
                item: selecteditem ?? items.first,
                color: selectedColor ?? colors.first.color,
              )));                
            }),
            SelectedItemsColumn(itemBloc: bloc)
          ],
        ),
      )),
    );
  }
}

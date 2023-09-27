import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/item_bloc/bloc/item_bloc.dart';
import 'package:project2/widgets/colors_tab_bar.dart';
import 'package:project2/widgets/item.dart';
import 'package:project2/widgets/items_tab_bar.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  List<Item> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    final itemBloc = ItemBloc();
    return Scaffold(
      backgroundColor: const Color.fromARGB(115, 84, 84, 84),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(115, 84, 84, 84),
        title: const Text('My App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: BlocProvider(
        create: (context) => itemBloc,
        child: BlocBuilder<ItemBloc, ItemState>(
          bloc: itemBloc,
          builder: (context, state) {
            final Item item = state.item;
            final Color color = state.color;
            
            return Column(
              children: [
                ItemsTabBar(itemBloc: itemBloc),
                ColorsTabBar(itemBloc: itemBloc),
                const Padding(padding: EdgeInsets.only(top: 30)),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedItems.add(Item(
                          color: color,
                          width: item.width,
                          height: item.height,
                          bottomLeftR: item.bottomLeftR,
                          bottomRightR: item.bottomRightR,
                          topLeftR: item.topLeftR,
                          topRightR: item.topRightR,
                          margin: 30,
                          borderColor: color,
                        ));
                      });
                    },
                    child: const Text('Add')),
                const Padding(padding: EdgeInsets.only(top: 30)),
                Column(
                  children: [
                    ...selectedItems.map((item) => item)
                  ],
                )
              ],
            );
          },
        ),
      )),
    );
  }
}

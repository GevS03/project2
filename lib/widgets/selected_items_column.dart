import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/item_bloc/bloc/item_bloc.dart';

class SelectedItemsColumn extends StatelessWidget {
  const SelectedItemsColumn({
    super.key,
    required this.itemBloc,
  });

  final ItemBloc itemBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      bloc: itemBloc,
      builder: (context, state) {
        return Column(
          children: state.selectedItems,
        );
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project2/widgets/selected_item_model.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemState()) {
    on<ItemAddEvent>(_addItem);
  }

  _addItem(ItemAddEvent event, Emitter emit) {
    final List<SelectedItem> selectedItems = [...state.selectedItems];
    selectedItems.add(event.selectedItem);
    emit(state.copyWith(selectedItems: selectedItems));

  }
}

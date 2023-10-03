import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project2/widgets/item.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemState()) {
    on<ItemAddEvent>(_addItem);
  }

  _addItem(ItemAddEvent event, Emitter emit) {
    emit(state.copyWith(selectedItems: event.selectedItems));
    state.selectedItems.add(event.selectedItem);
  }
}

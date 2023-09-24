import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project2/item.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemState()) {
    on<ItemAddItemEvent>(_addItem);
    on<ItemAddColorEvent>(_addColor);
  }

  _addItem(ItemAddItemEvent event, Emitter emit) {
    emit(state.copyWith(item: event.item));
  }

  _addColor(ItemAddColorEvent event, Emitter emit) {
    emit(state.copyWith(color: event.color));
  }
}

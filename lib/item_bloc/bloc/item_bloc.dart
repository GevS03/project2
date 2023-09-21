import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemState()) {
    on<ItemMarkEvent>(_onMark);
  }

  _onMark(ItemMarkEvent event, Emitter emit) {
    emit(state.copyWith(color: event.color, selected: event.selected));
  }
}

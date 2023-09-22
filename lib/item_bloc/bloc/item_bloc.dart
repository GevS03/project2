import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project2/item.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemState()) {
    on<ItemAddEvent>(_add);
  }

  _add(ItemAddEvent event, Emitter emit) {
    emit(state.copyWith(item: event.item));
  }
}

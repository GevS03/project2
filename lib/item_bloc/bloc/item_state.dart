part of 'item_bloc.dart';


class ItemState {
  final Item item;
  List<Item> selectedItems = [];

  ItemState({this.item = const Item(width: 50, height: 50)});

  ItemState copyWith({
    Item? item,
  }) {
    return ItemState(item: item ?? this.item);
  }
}

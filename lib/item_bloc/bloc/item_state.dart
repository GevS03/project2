part of 'item_bloc.dart';

class ItemState {
  final Item item;
  final Color color;
  List<Item> selectedItem = [];

  ItemState(
      {this.item = const Item(width: 50, height: 50), this.color = Colors.red});

  ItemState copyWith({
    Item? item,
    Color? color,
  }) {
    return ItemState(item: item ?? this.item, color: color ?? this.color);
  }
}

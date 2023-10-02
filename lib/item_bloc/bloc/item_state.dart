part of 'item_bloc.dart';

class ItemState {
  final List<Item> selectedItems;

  ItemState({this.selectedItems = const []});

  ItemState copyWith({
    List<Item>? selectedItems,
  }) {
    return ItemState(selectedItems: selectedItems ?? this.selectedItems);
  }
}

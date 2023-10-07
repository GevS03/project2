part of 'item_bloc.dart';

class ItemState {
  List<SelectedItem> selectedItems;

  ItemState({this.selectedItems = const []});

  ItemState copyWith({
    List<SelectedItem>? selectedItems,
  }) {
    return ItemState(selectedItems: selectedItems ?? this.selectedItems);
  }
}

part of 'item_bloc.dart';

@immutable
sealed class ItemEvent {}

class ItemAddEvent extends ItemEvent {
  final List<Item> selectedItems;
  final Item selectedItem;

  ItemAddEvent({required this.selectedItems, required this.selectedItem});
}


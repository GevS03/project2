part of 'item_bloc.dart';

@immutable
sealed class ItemEvent {}

class ItemAddEvent extends ItemEvent {
  final List<Item> selectedItems;

  ItemAddEvent({required this.selectedItems});
}


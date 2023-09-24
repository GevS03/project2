part of 'item_bloc.dart';

@immutable
sealed class ItemEvent {}

class ItemAddItemEvent extends ItemEvent {
  final Item item;

  ItemAddItemEvent({required this.item});
}

class ItemAddColorEvent extends ItemEvent{
  final Color color;

  ItemAddColorEvent({required this.color});
}

part of 'item_bloc.dart';

@immutable
sealed class ItemEvent {}

class ItemAddEvent extends ItemEvent {
  final Item item;

  ItemAddEvent({required this.item});
}

part of 'item_bloc.dart';

@immutable
sealed class ItemEvent {}

class ItemMarkEvent extends ItemEvent {
  final Color color;
  final bool selected;

  ItemMarkEvent({required this.color, required this.selected});
}

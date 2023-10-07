part of 'item_bloc.dart';

@immutable
sealed class ItemEvent {}

class ItemAddEvent extends ItemEvent {
  final SelectedItem selectedItem;

  ItemAddEvent({required this.selectedItem});
}


part of 'item_bloc.dart';

@immutable
class ItemState {
  final Color color;
  final bool selected;

  ItemState({this.color = Colors.grey, this.selected = false});

  ItemState copyWith({
    bool? selected,
    Color? color
  }) {
    
    return ItemState(color: color ?? this.color, selected: selected ?? this.selected);
  }
}

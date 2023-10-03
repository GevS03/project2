import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onPressed});

  final void Function() onPressed; 

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                onPressed: onPressed,
                child: const Text('Add Item'));
  }
}
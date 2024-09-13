import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final String label;
  final int value;
  final List<int> items;
  final ValueChanged<int?> onChanged;

  DropdownWidget({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        DropdownButton<int>(
          value: value,
          onChanged: onChanged,
          isExpanded: true,
          items: items.map((int item) {
            return DropdownMenuItem<int>(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
        ),
      ],
    );
  }
}

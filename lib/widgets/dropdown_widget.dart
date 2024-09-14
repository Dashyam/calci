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
        Text(label, style: TextStyle(color: const Color.fromARGB(255, 36, 36, 36), fontWeight: FontWeight.bold), ),
       const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: value,
          onChanged: onChanged,
          isExpanded: true,
          decoration: InputDecoration(
            
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2
              )
            )
          
          ),
          items: items.map((int item) {
            return DropdownMenuItem<int>(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
          // Setting a fixed height and enabling scrolling
          itemHeight: 50, // Adjust height as needed
        ),
      ],
    );
  }
}
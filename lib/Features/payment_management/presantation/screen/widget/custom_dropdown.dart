import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        onChanged: onChanged,
        underline: SizedBox(),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final Function(String) onSearch;

  const CustomSearchField({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSearch,
      decoration: InputDecoration(
        hintText: 'Search by Order ID and Shop Name',
        prefixIcon: Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: Color(0xFFF1F1F1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      ),
    );
  }
}

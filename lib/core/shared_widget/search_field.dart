import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_text_field.dart';

/// {@template search_field}
/// SearchField widget.
/// {@endtemplate}
class CustomSearchField extends StatefulWidget {
  /// {@macro search_field}
  const CustomSearchField({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.suffixIcon,
  });

  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;

  @override
  _CustomSearchFieldState createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      if (widget.onChanged != null) {
        widget.onChanged!(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final fieldWidth = screenWidth < 800 ? screenWidth * 0.9 : screenWidth * 0.5;

    return SizedBox(
      width: fieldWidth,
      child: CustomTextField(
        height: 50,
        hintText: widget.hintText,
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(Icons.search_outlined),
        ),
        controller: widget.controller,
        onChanged: _onSearchChanged,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}

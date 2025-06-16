
import 'package:flutter/material.dart';
import 'custom_dropdown.dart';
import 'custom_search_field.dart';

class SearchDropdownFilter extends StatelessWidget {
  final List<String> dropdownItems;
  final String selectedItem;
  final ValueChanged<String?>? onDropdownChanged;
  final Function(String) onSearch;
  final String searchHintText;

  const SearchDropdownFilter({
    Key? key,
    required this.dropdownItems,
    required this.selectedItem,
    required this.onDropdownChanged,
    required this.onSearch,
    this.searchHintText = 'Search by Order ID and Shop Name',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.1,
      width: MediaQuery.sizeOf(context).width * 0.9,
      color: const Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CustomSearchField(
                onSearch: onSearch,
                hintText: searchHintText,
              ),
            ),
            const SizedBox(width: 12),
            CustomDropdown(
              items: dropdownItems,
              selectedItem: selectedItem,
              onChanged: onDropdownChanged,
            ),
          ],
        ),
      ),
    );
  }
}

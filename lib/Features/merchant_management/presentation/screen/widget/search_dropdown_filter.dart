import 'package:flutter/material.dart';
import '../../../../../core/shared_widget/search_field.dart';
import '../../../../payment_management/presantation/screen/widget/custom_dropdown.dart';


class MerchantSearchDropdownFilter extends StatelessWidget {
  final List<String> dropdownItems;
  final String selectedItem;
  final ValueChanged<String?>? onDropdownChanged;
  final Function(String) onSearch;
  final VoidCallback? onFilterPressed;
  final String searchHintText;

  const MerchantSearchDropdownFilter({
    Key? key,
    required this.dropdownItems,
    required this.selectedItem,
    required this.onDropdownChanged,
    required this.onSearch,
    this.onFilterPressed,
    this.searchHintText = 'Search by Merchant Name',
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
                onChanged: onSearch,
                hintText: searchHintText,
              ),
            ),
            const SizedBox(width: 12),
            CustomDropdown(
              items: dropdownItems,
              selectedItem: selectedItem,
              onChanged: onDropdownChanged,
            ),
            const SizedBox(width: 12),
            // ElevatedButton.icon(
            //   onPressed: onFilterPressed,
            //   icon: const Icon(Icons.filter_alt, size: 18),
            //   label: const Text('Filter'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: const Color(0xFF0D4D45),
            //     //foregroundColor: Colors.white,
            //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(6),
            //     ),
            //   ),
            // )

            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.07,
              width: MediaQuery.sizeOf(context).width * 0.10,
              child: ElevatedButton.icon(
                onPressed: onFilterPressed,
                icon: const Icon(Icons.filter_alt, size: 18),
                label: const Text('Apply Filter'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D4D45),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

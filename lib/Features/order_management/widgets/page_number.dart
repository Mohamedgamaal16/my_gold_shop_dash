//  import 'package:flutter/material.dart';
// import 'package:my_gold_dashboard/core/styles/colors.dart';

// List<Widget> buildPageNumbers() {
//     List<Widget> pageNumbers = [];

//     // Calculate which pages to show
//     int startPage = 0;
//     int endPage = _totalPages - 1;

//     // If we have more than 5 pages, show a subset
//     if (_totalPages > 5) {
//       if (_currentPage <= 2) {
//         // Show first 3 pages
//         startPage = 0;
//         endPage = 2;
//       } else if (_currentPage >= _totalPages - 3) {
//         // Show last 3 pages
//         startPage = _totalPages - 3;
//         endPage = _totalPages - 1;
//       } else {
//         // Show current page and neighbors
//         startPage = _currentPage - 1;
//         endPage = _currentPage + 1;
//       }
//     }

//     for (int i = startPage; i <= endPage; i++) {
//       pageNumbers.add(
//         GestureDetector(
//           onTap: () => _goToPage(i),
//           child: Container(
//             width: 32,
//             height: 32,
//             margin: const EdgeInsets.symmetric(horizontal: 2),
//             decoration: BoxDecoration(
//               color:
//                   i == _currentPage
//                       ? AppColors
//                           .colorsPrimary2 // Dark green for active page
//                       : Colors.transparent,
//               borderRadius: BorderRadius.circular(4),
//               border: Border.all(
//                 color:
//                     i == _currentPage
//                         ? AppColors.colorsPrimary2
//                         : Colors.grey.shade300,
//                 width: 1,
//               ),
//             ),
//             child: Center(
//               child: Text(
//                 '${i + 1}',
//                 style: TextStyle(
//                   color:
//                       i == _currentPage
//                           ? AppColors.colorsSurface
//                           : AppColors.colorsText,
//                   fontWeight:
//                       i == _currentPage ? FontWeight.w600 : FontWeight.w400,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     }

//     return pageNumbers;
//   }
import 'package:flutter/material.dart';

class NavigationItem {
  final IconData icon;
  final IconData selectedIcon;
  final String title;
  final String route;
  final int index;

  const NavigationItem({
    required this.icon,
    required this.selectedIcon,
    required this.title,
    required this.route,
    required this.index,
  });
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_gold_dashboard/Features/home/model/nav_item_model.dart';
import 'package:my_gold_dashboard/core/routes/routes.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(tabIndex: 0));

  // Main navigation items (for bottom navigation or main tabs)
  final List<NavigationItem> mainNavigationItems = [
    NavigationItem(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      title: 'الرئيسية',
      route: Routes.homeScreen,
      index: 0,
    ),
    NavigationItem(
      icon: Icons.shopping_cart_outlined,
      selectedIcon: Icons.shopping_cart,
      title: 'جميع الطلبات',
      route: Routes.allorders,
      index: 1,
    ),
    NavigationItem(
      icon: Icons.pending_outlined,
      selectedIcon: Icons.pending,
      title: 'طلبات قيد التنفيذ',
      route: Routes.pendingOrders,
      index: 2,
    ),
    NavigationItem(
      icon: Icons.people_outline,
      selectedIcon: Icons.people,
      title: 'ملفات العاملين',
      route: Routes.workerAccounts,
      index: 3,
    ),
    NavigationItem(
      icon: Icons.add_circle_outline,
      selectedIcon: Icons.add_circle,
      title: 'طلب جديد',
      route: Routes.newOrder,
      index: 4,
    ),
  ];

  // Extended sidebar navigation items
  final List<NavigationItem> sidebarNavigationItems = [
    NavigationItem(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      title: 'Dashboard',
      route: Routes.homeScreen,
      index: 0,
    ),
    NavigationItem(
      icon: Icons.shopping_cart_outlined,
      selectedIcon: Icons.shopping_cart,
      title: 'Order Management',
      route: Routes.orderManagement,
      index: 1,
    ),
    NavigationItem(
      icon: Icons.store_outlined,
      selectedIcon: Icons.store,
      title: 'Merchant Management',
      route: Routes.merchantManagement,
      index: 2,
    ),
    NavigationItem(
      icon: Icons.local_shipping_outlined,
      selectedIcon: Icons.local_shipping,
      title: 'Delivery Personnel',
      route: Routes.deliveryPersonnel,
      index: 3,
    ),
    NavigationItem(
      icon: Icons.flag_outlined,
      selectedIcon: Icons.flag,
      title: 'Banner Management',
      route: Routes.bannerManagement,
      index: 4,
    ),
    NavigationItem(
      icon: Icons.people_outline,
      selectedIcon: Icons.people,
      title: 'Customer Management',
      route: Routes.customerManagement,
      index: 5,
    ),
    NavigationItem(
      icon: Icons.payment_outlined,
      selectedIcon: Icons.payment,
      title: 'Payment Management',
      route: Routes.paymentManagement,
      index: 6,
    ),
    NavigationItem(
      icon: Icons.star_outline,
      selectedIcon: Icons.star,
      title: 'Customer Rating Review',
      route: Routes.customerRatingReview,
      index: 7,
    ),
    NavigationItem(
      icon: Icons.report_problem_outlined,
      selectedIcon: Icons.report_problem,
      title: 'Complaints Management',
      route: Routes.complaintsManagement,
      index: 8,
    ),
    NavigationItem(
      icon: Icons.keyboard_return_outlined,
      selectedIcon: Icons.keyboard_return,
      title: 'Return Management',
      route: Routes.returnManagement,
      index: 9,
    ),
    NavigationItem(
      icon: Icons.bar_chart_outlined,
      selectedIcon: Icons.bar_chart,
      title: 'Reports',
      route: Routes.reports,
      index: 10,
    ),
    NavigationItem(
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
      title: 'Settings',
      route: Routes.settings,
      index: 11,
    ),
  ];

  // Get navigation items based on context (main or sidebar)
  List<NavigationItem> get navigationItems => sidebarNavigationItems;

  void setTab(int index, BuildContext context) {
    if (index >= 0 && index < navigationItems.length) {
      emit(NavigationState(tabIndex: index));
      // Navigate using GoRouter
      final route = navigationItems[index].route;
      context.go(route);
    }
  }

  void setTabByRoute(String route) {
    final index = navigationItems.indexWhere((item) => item.route == route);
    if (index != -1) {
      emit(NavigationState(tabIndex: index));
    }
  }

  void logout(BuildContext context) {
    // Clear any stored user data here
    context.go(Routes.login);
  }

  NavigationItem get currentNavigationItem => navigationItems[state.tabIndex];
  String get currentRoute => navigationItems[state.tabIndex].route;

  // Helper method to check if a route is currently selected
  bool isRouteSelected(String route) {
    return currentRoute == route;
  }

  // Helper method to get navigation item by route
  NavigationItem? getNavigationItemByRoute(String route) {
    try {
      return navigationItems.firstWhere((item) => item.route == route);
    } catch (e) {
      return null;
    }
  }
}
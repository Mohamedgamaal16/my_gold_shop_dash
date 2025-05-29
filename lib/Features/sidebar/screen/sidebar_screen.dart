import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/sidebar/nav_cubit/navigation_cubit.dart';
import 'package:my_gold_dashboard/Features/sidebar/widget/sidebar_widget.dart';
import 'package:my_gold_dashboard/core/service/cubit/network_cubit/network_cubit.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';

import 'package:go_router/go_router.dart';


class SideBarScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const SideBarScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  State<SideBarScreen> createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> {
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = NavigationCubit();
    
    // Set initial tab based on current route
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateTabFromRoute();
    });
  }

  void _updateTabFromRoute() {
    final currentRoute = GoRouterState.of(context).uri.path;
    navigationCubit.setTabByRoute(currentRoute);
  }

  @override
  void didUpdateWidget(SideBarScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update tab when route changes
    _updateTabFromRoute();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: navigationCubit,
      child: Scaffold(
        backgroundColor: AppColors.colorsBackground,
        body: BlocBuilder<NavigationCubit, NavigationState>(
          bloc: navigationCubit,
          builder: (context, state) {
            return Row(
              children: [
                // Sidebar
                SidebarWidget(
                  currentIndex: state.tabIndex,
                  navigationCubit: navigationCubit,
                  onTap: (index, context) {
                    navigationCubit.setTab(index, context);
                    // Also update the shell navigation
                    widget.navigationShell.goBranch(index);
                  },
                ),
                // Main content area
                Expanded(
                  child: widget.navigationShell,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    navigationCubit.close();
    super.dispose();
  }
}
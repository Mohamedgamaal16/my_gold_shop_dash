import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/sidebar/nav_cubit/navigation_cubit.dart';
import 'package:my_gold_dashboard/Features/sidebar/widget/sidebar_widget.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:go_router/go_router.dart';

class SideBarScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const SideBarScreen({
    super.key,
    required this.navigationShell,
  });

  // void _updateTabFromRoute(BuildContext context) {
  //   final currentRoute = GoRouterState.of(context).uri.path;
  //   context.read<NavigationCubit>().setTabByRoute(currentRoute);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit()..setTabByRoute(GoRouterState.of(context).uri.path),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.colorsBackground,
            body: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
                final navigationCubit = context.read<NavigationCubit>();

                return Row(
                  children: [
                    SidebarWidget(
                      currentIndex: state.tabIndex,
                      navigationCubit: navigationCubit,
                      onTap: (index, context) {
                        navigationCubit.setTab(index, context);
                        navigationShell.goBranch(index);
                      },
                    ),
                    Expanded(child: navigationShell),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

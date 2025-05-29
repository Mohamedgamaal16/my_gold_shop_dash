import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_gold_dashboard/Features/sidebar/nav_cubit/navigation_cubit.dart';
import 'package:my_gold_dashboard/core/routes/routes.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class SidebarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int, BuildContext) onTap;
  final NavigationCubit navigationCubit;

  const SidebarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.navigationCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: const BoxDecoration(color: AppColors.colorsPrimary2),
      child: Column(
        children: [
          Image.asset("idetity/logo.png", width: 200, height: 50),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: navigationCubit.navigationItems.length,
              itemBuilder: (context, index) {
                final item = navigationCubit.navigationItems[index];
                final isSelected = currentIndex == index;

                return _buildNavItem(
                  icon: isSelected ? item.selectedIcon : item.icon,
                  title: item.title,
                  index: index,
                  isSelected: isSelected,
                  context: context,
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            child: _buildLogoutItem(context),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String title,
    required int index,
    required bool isSelected,
    required BuildContext context,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(index, context),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color:
                  isSelected ? AppColors.colorsSecondary2 : Colors.transparent,
            ),
            child: Row(
              children: [
                Icon(icon, color: AppColors.colorsSurface, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.menuTabs(
                      context,
                    ).copyWith(color: AppColors.colorsSurface),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutItem(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.go(Routes.login);
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              const Icon(
                Icons.logout_outlined,
                color: AppColors.colorsSurface,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                'تسجيل خروج',
                style: AppTextStyles.menuTabs(
                  context,
                ).copyWith(color: AppColors.colorsSurface),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

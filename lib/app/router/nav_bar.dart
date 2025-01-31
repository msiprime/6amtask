import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stackfood/core/global/theme/app_colors.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomAppBar(
        height: 56,
        color: Colors.white,

        /// This would produce the effect of stack food demo :p
        // shape: const CircularNotchedRectangle(),
        // notchMargin: AppSize.md,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BuildNavItem(
                onTap: () => _goBranch(0),
                label: "Home",
                icon: Icons.home,
                isSelected: navigationShell.currentIndex == 0),
            _BuildNavItem(
                onTap: () => _goBranch(1),
                label: "Wishlist",
                icon: Icons.favorite_border,
                isSelected: navigationShell.currentIndex == 1),
            const SizedBox(width: 100),
            _BuildNavItem(
                onTap: () => _goBranch(3),
                label: "label",
                icon: Icons.receipt_long,
                isSelected: navigationShell.currentIndex == 3),
            _BuildNavItem(
                onTap: () => _goBranch(4),
                label: 'More',
                icon: Icons.menu,
                isSelected: navigationShell.currentIndex == 4)
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppColors.green,
          elevation: 0,
          onPressed: () {
            _goBranch(2);
          },
          child: const Icon(Icons.shopping_cart, color: Colors.white, size: 28),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

/// Custom Bottom Nav Bar Item
/// That Somehow mimic the bottom nav bar feels

class _BuildNavItem extends StatelessWidget {
  const _BuildNavItem({
    required this.onTap,
    required this.label,
    required this.icon,
    required this.isSelected,
  });

  final String label;
  final IconData icon;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: IconButton(
        onPressed: onTap,
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
        ),
        icon: Icon(
          icon,
          color: isSelected ? AppColors.green : AppColors.grey,
        ),
      ),
    );
  }
}

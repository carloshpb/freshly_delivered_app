// Stateful nested navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/custom_colors.dart';
import '../../../../constants/strings.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        //clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(
          horizontal: 22.0,
          vertical: 9.0,
        ),
        color: Colors.transparent,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20.0),
        //   color: Colors.transparent,
        // ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: BottomNavigationBar(
            backgroundColor: CustomColors.buttonGreen,
            onTap: _goBranch,
            currentIndex: navigationShell.currentIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 30.0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            selectedFontSize: 10.0,
            unselectedFontSize: 10.0,
            // selectedIndex: navigationShell.currentIndex,
            // onDestinationSelected: _goBranch,

            items: [
              BottomNavigationBarItem(
                  label: Strings.home,
                  icon: Icon((navigationShell.currentIndex == 0)
                      ? Icons.home
                      : Icons.home_outlined)),
              BottomNavigationBarItem(
                  label: Strings.wishlist,
                  icon: Icon((navigationShell.currentIndex == 1)
                      ? Icons.favorite
                      : Icons.favorite_outline)),
              BottomNavigationBarItem(
                  label: Strings.cart,
                  icon: Icon((navigationShell.currentIndex == 2)
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined)),
              BottomNavigationBarItem(
                  label: Strings.settings,
                  icon: Icon((navigationShell.currentIndex == 3)
                      ? Icons.settings
                      : Icons.settings_outlined)),
            ],
          ),
        ),
      ),
    );
  }
}

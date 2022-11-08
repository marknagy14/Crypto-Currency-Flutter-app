import 'package:crypto_currency/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'package:provider/provider.dart';

import '../../view_model/providers/screens_providers/bottom_navigation_provider.dart';
import '../../view_model/providers/theme_provider/theme_provider.dart';

class BottomNavigationView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context,listen: false);
    return Consumer<BottomNavigationProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: provider.currentScreen,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
          ),
          child: SafeArea(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(backgroundColor: Themes.isDarkMode(context)
                  ? Colors.black
                  : Colors.white,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                tabBackgroundColor: Colors.green[300]!,
                color: Themes.isDarkMode(context)
                    ? Colors.white
                    : Colors.black,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: provider.currentScreenIndex,
                onTabChange: (index) {
                  provider.changeScreen(index);
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}

import 'package:crypto_currency/view/screens/in_app_screens/home_screen.dart';
import 'package:crypto_currency/view/screens/in_app_screens/profile_screen.dart';
import 'package:crypto_currency/view/screens/in_app_screens/search_screen.dart';
import 'package:flutter/material.dart';


class BottomNavigationProvider extends ChangeNotifier {



  int currentScreenIndex = 0;

  Widget currentScreen = HomeScreen();

  void changeScreen(int index) {
    currentScreenIndex = index;

    switch (index) {
      case (0):
        currentScreen = HomeScreen();
        break;

      case (1):
        currentScreen = SearchScreen();
        break;

      case (2):
        currentScreen = PhotoScreen();
        break;
    }
    notifyListeners();
  }

}

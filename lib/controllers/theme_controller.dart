import 'package:cocuisinage_app_mobile_pro/Theme/my_colors.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  bool dark = false;

  void switchTheme() {
    dark = !dark;
    notifyListeners();
  }

  ThemeData get themeData => dark
      ? ThemeData.dark().copyWith(
          expansionTileTheme: const ExpansionTileThemeData(
              iconColor: Colors.white, textColor: Colors.white),
          scaffoldBackgroundColor: Colors.black,
          cardColor: const Color(0xFF202020),
          bottomAppBarColor: const Color(0xFF202020),
          drawerTheme:
              const DrawerThemeData(backgroundColor: Color(0xFF202020)),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: MyColors.red))
      : ThemeData.light().copyWith(
          expansionTileTheme: const ExpansionTileThemeData(
              iconColor: Colors.black, textColor: Colors.black),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: MyColors.red));
}

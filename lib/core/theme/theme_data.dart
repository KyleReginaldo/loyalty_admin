import 'package:flutter/material.dart';
import 'package:loyalty_admin/core/theme/color.dart';

class Themes {
  static ThemeData themes() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: brown,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
    );
  }
}

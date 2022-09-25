import 'package:flutter/material.dart';
import 'package:loyalty_admin/core/theme/color.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? function;
  const CustomNavBar({super.key, required this.currentIndex, this.function});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: BottomNavigationBar(
        selectedFontSize: 12,
        selectedItemColor: brown,
        unselectedItemColor: Colors.grey.shade500,
        currentIndex: currentIndex,
        onTap: function,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Upload Promos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Upload Menu',
          ),
        ],
      ),
    );
  }
}

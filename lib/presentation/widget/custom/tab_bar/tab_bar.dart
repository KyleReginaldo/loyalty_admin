import 'package:flutter/material.dart';

import '../../components/custom_text.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  const CustomTabBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TabBar(
        unselectedLabelColor: Colors.black,
        labelColor: Colors.white,
        indicatorColor: Colors.black,
        indicatorWeight: 2,
        indicator: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(6),
        ),
        controller: controller,
        tabs: const [
          Tab(
            icon: CustomRoboto(
              text: 'Users',
              weight: FontWeight.w600,
            ),
          ),
          Tab(
            icon: CustomRoboto(
              text: 'Reservation',
              weight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

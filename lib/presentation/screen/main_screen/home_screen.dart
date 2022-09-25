import 'package:flutter/material.dart';
import 'package:loyalty_admin/presentation/widget/components/custom_container.dart';
import 'package:loyalty_admin/presentation/widget/custom/tab_bar/tab_bar.dart';
import 'package:loyalty_admin/presentation/widget/custom/tab_bar/tab_bar_view.dart';
import 'package:loyalty_admin/presentation/widget/helper/widget_builder.dart';

import '../../widget/components/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomRoboto(
                text: 'Hello!\nWelcome Back Admin',
                size: 22,
                weight: FontWeight.w600,
                color: Colors.white,
              ),
              Image.asset('assets/image/qr.png')
            ],
          ),
          const SizedBox(height: 20),
          CustomTabBar(controller: _tabController),
          const SizedBox(height: 30),
          rowCounter('0', 'Coupons'),
          Expanded(child: CustomTabBarView(controller: _tabController)),
          CustomContainer(label: 'Export', onTap: () {}),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}

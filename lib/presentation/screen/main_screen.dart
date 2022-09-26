import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_admin/presentation/cubit/bottomnav/bottom_navigation_cubit.dart';
import 'package:loyalty_admin/presentation/screen/main_screen/home_screen.dart';
import 'package:loyalty_admin/presentation/screen/main_screen/upload_menu_screen.dart';
import 'package:loyalty_admin/presentation/screen/main_screen/upload_promo_screen.dart';
import 'package:loyalty_admin/presentation/widget/custom/custom_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List screen = [
    const HomeScreen(),
    const UploadPromoScreen(),
    const UploadMenuScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final currentIndex =
            context.select((BottomNavigationCubit bnb) => bnb.state.index);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          body: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/bg.png'),
                fit: BoxFit.fill,
                opacity: 0.3,
              ),
            ),
            child: screen[currentIndex],
          ),
          bottomNavigationBar: CustomNavBar(
            currentIndex: currentIndex,
            function: (value) {
              context.read<BottomNavigationCubit>().navigate(value);
            },
          ),
        );
      },
    );
  }
}

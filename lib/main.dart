import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_admin/core/theme/theme_data.dart';
import 'package:loyalty_admin/presentation/cubit/bottomnav/bottom_navigation_cubit.dart';
import 'package:loyalty_admin/presentation/cubit/customer/customer_cubit.dart';
import 'package:loyalty_admin/presentation/cubit/image_menu/image_menu_cubit.dart';
import 'package:loyalty_admin/presentation/cubit/image_promo/image_promo_cubit.dart';
import 'package:loyalty_admin/presentation/cubit/reservation/reservation_cubit.dart';
import 'package:loyalty_admin/presentation/cubit/storage_cubit/storage_cubit.dart';
import 'package:loyalty_admin/presentation/screen/main_screen.dart';
import 'dependency_injection.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.themes(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CustomerCubit>(
            create: (context) => sl<CustomerCubit>()..fetchCustomer(),
          ),
          BlocProvider<ReservationCubit>(
            create: (context) => sl<ReservationCubit>()..fetchReservation(),
          ),
          BlocProvider<ImageMenuCubit>(
            create: (context) => ImageMenuCubit(),
          ),
          BlocProvider<ImagePromoCubit>(
            create: (context) => ImagePromoCubit(),
          ),
          BlocProvider<StorageCubit>(
            create: (context) => sl<StorageCubit>(),
          ),
          BlocProvider<BottomNavigationCubit>(
            create: (context) => BottomNavigationCubit(),
          ),
        ],
        child: const MainScreen(),
      ),
    );
  }
}

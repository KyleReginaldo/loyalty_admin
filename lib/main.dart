import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_admin/core/theme/theme_data.dart';
import 'package:loyalty_admin/presentation/cubit/customer/customer_cubit.dart';
import 'package:loyalty_admin/presentation/cubit/menu/menu_cubit.dart';
import 'package:loyalty_admin/presentation/cubit/promo/promo_cubit.dart';
import 'package:loyalty_admin/presentation/cubit/reservation/reservation_cubit.dart';
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
          BlocProvider<MenuCubit>(
            create: (context) => sl<MenuCubit>(),
          ),
          BlocProvider<PromoCubit>(
            create: (context) => sl<PromoCubit>(),
          ),
        ],
        child: const MainScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection.dart';
import '../../../cubit/customer/customer_cubit.dart';
import '../../../cubit/reservation/reservation_cubit.dart';
import '../../../screen/main_screen/customer_detail_screen.dart';
import '../../components/custom_text.dart';
import '../user_container.dart';

class CustomTabBarView extends StatelessWidget {
  final TabController controller;
  const CustomTabBarView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: [
        BlocBuilder<CustomerCubit, CustomerState>(
          builder: (context, state) {
            if (state is CustomerLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CustomerLoaded) {
              return Expanded(
                  child: Column(
                      children: state.customer.map((e) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  BlocProvider<CustomerCubit>(
                                    create: (context) =>
                                        sl<CustomerCubit>()..fetchCustomer(),
                                    child: const CustomerDetailScreen(),
                                  ))));
                    },
                    child: UserContainer(e: e));
              }).toList()));
            } else if (state is CustomerEmpty) {
              return const Center(
                child: CustomRoboto(
                  text: 'Empty :((',
                  color: Colors.white,
                ),
              );
            } else {
              return const Center(
                  child: CustomRoboto(
                text: 'Error',
                color: Colors.white,
              ));
            }
          },
        ),
        BlocBuilder<ReservationCubit, ReservationState>(
          builder: (context, state) {
            if (state is ReservationLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ReservationLoaded) {
              return Expanded(
                  child: Column(
                children: state.reservation.map((e) {
                  return Container(
                    color: Colors.red,
                  );
                }).toList(),
              ));
            } else if (state is ReservationEmpty) {
              return const Center(
                child: CustomRoboto(
                  text: 'Empty :((',
                  color: Colors.white,
                ),
              );
            } else {
              return const Center(
                child: CustomRoboto(
                  text: 'Error',
                  color: Colors.white,
                ),
              );
            }
          },
        )
        // ReservationContainer(),
      ],
    );
  }
}

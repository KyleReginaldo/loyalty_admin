import 'package:flutter/material.dart';
import 'package:loyalty_admin/core/theme/color.dart';
import 'package:loyalty_admin/domain/entity/customer_entity.dart';
import 'package:loyalty_admin/presentation/widget/components/custom_text.dart';

class UserContainer extends StatelessWidget {
  final CustomerEntity e;
  const UserContainer({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/image/bg.png',
              height: 85,
              width: 85,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRoboto(
                  text: '${e.firstname} ${e.lastname}',
                  weight: FontWeight.w600,
                  size: 16,
                ),
                CustomRoboto(
                  text: e.contact,
                  color: brown,
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: brown,
            ),
            child: const CustomRoboto(
              text: '2',
              color: Colors.white,
            ),
          ),
          GestureDetector(onTap: () {}, child: const Icon(Icons.arrow_right))
        ],
      ),
    );
  }
}

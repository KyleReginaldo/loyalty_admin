import 'package:flutter/material.dart';

import '../components/custom_text.dart';

Widget rowCounter(String counts, String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomRoboto(
          text: 'Total: $counts',
          color: Colors.white,
          weight: FontWeight.w600,
        ),
        CustomRoboto(
          text: title,
          color: Colors.white,
        )
      ],
    ),
  );
}

Widget textfieldLabel(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: [
        CustomRoboto(
          text: label,
          size: 16,
          weight: FontWeight.w600,
          color: Colors.white,
        ),
        const CustomRoboto(text: '*', color: Colors.red)
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomContainer extends StatelessWidget {
  final String label;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  const CustomContainer({
    super.key,
    required this.label,
    this.height,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(19),
        height: height ?? 60,
        width: width ?? 250,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(9)),
        child: CustomRoboto(
          text: label,
          size: 16,
          weight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}

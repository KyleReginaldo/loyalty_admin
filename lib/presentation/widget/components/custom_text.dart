import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRoboto extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final TextAlign? align;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLine;
  const CustomRoboto({
    super.key,
    required this.text,
    this.size,
    this.weight,
    this.align,
    this.color,
    this.overflow,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLine,
      style: GoogleFonts.robotoSerif(
          textStyle: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      )),
    );
  }
}

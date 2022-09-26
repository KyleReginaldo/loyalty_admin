import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../components/custom_text.dart';

class CustomUploadImage extends StatelessWidget {
  final Function()? onTap;
  final Widget image;
  const CustomUploadImage({super.key, this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        color: Colors.white,
        strokeWidth: 1,
        dashPattern: const [6, 3, 2, 3],
        child: Container(
          height: 150,
          width: double.infinity,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.8),
          ),
          child: Stack(
            children: [
              image,
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/uploadimage.png',
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRoboto(
                          text: 'Upload your image',
                          weight: FontWeight.w600,
                          size: 16,
                          color: Colors.grey.shade700,
                        ),
                        CustomRoboto(
                          text: 'Supports .JPG, .PNG',
                          weight: FontWeight.w600,
                          size: 12,
                          color: Colors.grey.shade700,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

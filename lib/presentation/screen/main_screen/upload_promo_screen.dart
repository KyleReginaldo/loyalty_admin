import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:loyalty_admin/domain/entity/promo_entity.dart';
import 'package:loyalty_admin/presentation/cubit/promo/promo_cubit.dart';
import 'package:loyalty_admin/presentation/widget/components/custom_container.dart';
import 'package:loyalty_admin/presentation/widget/components/custom_text.dart';
import 'package:loyalty_admin/presentation/widget/custom/custom_upload_image.dart';
import 'package:loyalty_admin/presentation/widget/helper/widget_builder.dart';

class UploadPromoScreen extends StatefulWidget {
  const UploadPromoScreen({super.key});

  @override
  State<UploadPromoScreen> createState() => _UploadPromoScreenState();
}

class _UploadPromoScreenState extends State<UploadPromoScreen> {
  final promoName = TextEditingController();
  final description = TextEditingController();
  final image = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 80),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: CustomRoboto(
                text: 'Promo Details:',
                color: Colors.white,
                size: 16,
                weight: FontWeight.w600,
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 20),
                textfieldLabel('Title'),
                CustomTextField(
                  'Name of Promo',
                  controller: promoName,
                  bgColor: Colors.white,
                ),
                const SizedBox(height: 20),
                textfieldLabel('Description'),
                CustomTextField(
                  'Details about your Promo',
                  controller: description,
                  bgColor: Colors.white,
                ),
                const SizedBox(height: 20),
                textfieldLabel('Image'),
                const SizedBox(height: 5),
                const CustomUploadImage()
              ],
            ),
          ),
          const SizedBox(height: 145),
          CustomContainer(
            label: 'UPLOAD NOW',
            onTap: () {
              final promo = PromoEntity(
                title: promoName.text,
                description: description.text,
                image: image,
              );
              context.read<PromoCubit>().addPromo(promo);
            },
          )
        ],
      ),
    );
  }
}

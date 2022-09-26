import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loyalty_admin/domain/entity/promo_entity.dart';
import 'package:loyalty_admin/presentation/cubit/image_promo/image_promo_cubit.dart';
import 'package:loyalty_admin/presentation/cubit/storage_cubit/storage_cubit.dart';
import 'package:loyalty_admin/presentation/widget/components/custom_text.dart';
import 'package:loyalty_admin/presentation/widget/custom/custom_upload_image.dart';
import 'package:loyalty_admin/presentation/widget/helper/widget_builder.dart';

import '../../widget/components/custom_container.dart';

class UploadPromoScreen extends StatefulWidget {
  const UploadPromoScreen({super.key});

  @override
  State<UploadPromoScreen> createState() => _UploadPromoScreenState();
}

class _UploadPromoScreenState extends State<UploadPromoScreen> {
  final promoName = TextEditingController();
  final description = TextEditingController();
  File? image;
  @override
  Widget build(BuildContext context) {
    return Column(
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
              CustomUploadImage(
                  onTap: () {
                    context
                        .read<ImagePromoCubit>()
                        .pickImage(ImageSource.gallery);
                  },
                  image: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Builder(
                      builder: (context) {
                        final image = context.select(
                            (ImagePromoCubit image) => image.state.image);
                        this.image = image;
                        return image != null
                            ? Image.file(
                                image,
                                fit: BoxFit.cover,
                              )
                            : const SizedBox();
                      },
                    ),
                  ))
            ],
          ),
        ),
        const Spacer(flex: 6),
        BlocBuilder<StorageCubit, StorageState>(
          builder: (context, state) {
            if (state is StorageLoading) {
              return const CustomContainer(
                label: 'UPLOAD NOW',
              );
            } else {
              return CustomContainer(
                label: 'UPLOAD NOW',
                onTap: () {
                  context.read<StorageCubit>().uploadToStorage(
                        'promo',
                        image ?? File(''),
                        promo: PromoEntity(
                          title: promoName.text,
                          description: description.text,
                        ),
                      );
                },
              );
            }
          },
        ),
        const SizedBox(height: 50)
      ],
    );
  }
}

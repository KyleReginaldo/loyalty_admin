import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loyalty_admin/domain/entity/menu_entity.dart';
import 'package:loyalty_admin/presentation/cubit/image_menu/image_menu_cubit.dart';
import 'package:loyalty_admin/presentation/widget/components/custom_container.dart';
import 'package:loyalty_admin/presentation/widget/components/custom_text.dart';
import 'package:loyalty_admin/presentation/widget/custom/custom_upload_image.dart';
import 'package:loyalty_admin/presentation/widget/helper/widget_builder.dart';

import '../../cubit/storage_cubit/storage_cubit.dart';

class UploadMenuScreen extends StatefulWidget {
  const UploadMenuScreen({super.key});

  @override
  State<UploadMenuScreen> createState() => _UploadMenuScreenState();
}

class _UploadMenuScreenState extends State<UploadMenuScreen> {
  final promoName = TextEditingController();
  final description = TextEditingController();
  final category = TextEditingController();
  final price = TextEditingController();
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
              text: 'Menu Details:',
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
                'Name of Product',
                controller: promoName,
                bgColor: Colors.white,
              ),
              const SizedBox(height: 30),
              textfieldLabel('Description'),
              CustomTextField(
                'Details about your Product',
                height: 40,
                controller: description,
                bgColor: Colors.white,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textfieldLabel('Categories'),
                        CustomTextField('Coffee, Food & Other',
                            controller: category,
                            bgColor: Colors.white,
                            suffix: const Icon(Icons.arrow_drop_down)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textfieldLabel('Price'),
                        CustomTextField(
                          '',
                          controller: price,
                          bgColor: Colors.white,
                          suffix: Container(
                            width: 1,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.all(5),
                            child: const CustomRoboto(text: '.00'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CustomRoboto(
                text: 'Image',
                color: Colors.white,
                size: 16,
                weight: FontWeight.w600,
              ),
              const SizedBox(height: 5),
              CustomUploadImage(
                image: SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Builder(
                    builder: (context) {
                      final image = context
                          .select((ImageMenuCubit image) => image.state.image);
                      this.image = image;
                      return image != null
                          ? Image.file(image, fit: BoxFit.cover)
                          : const SizedBox();
                    },
                  ),
                ),
                onTap: () {
                  context.read<ImageMenuCubit>().pickImage(ImageSource.gallery);
                },
              )
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
                        'menu',
                        image ?? File(''),
                        menu: MenuEntity(
                          title: promoName.text,
                          description: description.text,
                          categories: category.text,
                          price: price.text,
                        ),
                      );
                  promoName.text = '';
                  description.text = '';
                  category.text = '';
                  price.text = '';
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

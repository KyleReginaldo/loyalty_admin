import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:loyalty_admin/domain/entity/menu_entity.dart';
import 'package:loyalty_admin/presentation/cubit/menu/menu_cubit.dart';
import 'package:loyalty_admin/presentation/widget/components/custom_container.dart';
import 'package:loyalty_admin/presentation/widget/components/custom_text.dart';
import 'package:loyalty_admin/presentation/widget/custom/custom_upload_image.dart';
import 'package:loyalty_admin/presentation/widget/helper/widget_builder.dart';

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
                              alignment: Alignment.bottomRight,
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
                const CustomUploadImage()
              ],
            ),
          ),
          const SizedBox(height: 58),
          CustomContainer(
            label: 'UPLOAD NOW',
            onTap: () {
              final menu = MenuEntity(
                title: promoName.text,
                description: description.text,
                categories: category.text,
                price: price.text,
                image: image,
              );
              context.read<MenuCubit>().addMenu(menu);
            },
          )
        ],
      ),
    );
  }
}

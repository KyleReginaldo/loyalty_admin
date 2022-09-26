import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_promo_state.dart';

class ImagePromoCubit extends Cubit<ImagePromoInitial> {
  ImagePromoCubit() : super(ImagePromoInitial(image: null));
  void pickImage(ImageSource imageSource) async {
    final result = await ImagePicker().pickImage(source: imageSource);
    print('gumana');
    if (result == null) {
    } else {
      print('result: ${result.path}');
      emit(ImagePromoInitial(image: File(result.path)));
    }
  }
}

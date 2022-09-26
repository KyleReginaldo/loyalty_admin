import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_menu_state.dart';

class ImageMenuCubit extends Cubit<ImageMenuInitial> {
  ImageMenuCubit() : super(ImageMenuInitial(image: null));
  void pickImage(ImageSource imageSource) async {
    final result = await ImagePicker().pickImage(source: imageSource);
    print('gumana');
    if (result == null) {
    } else {
      print('result: ${result.path}');
      emit(ImageMenuInitial(image: File(result.path)));
    }
  }
}

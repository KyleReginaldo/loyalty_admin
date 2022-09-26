import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyalty_admin/domain/entity/menu_entity.dart';
import 'package:loyalty_admin/domain/entity/promo_entity.dart';
import 'package:loyalty_admin/domain/usecase/add_menu.dart';
import 'package:loyalty_admin/domain/usecase/add_promo.dart';
import 'package:loyalty_admin/domain/usecase/get_download_url.dart';
import 'package:loyalty_admin/domain/usecase/upload_to_storage.dart';

part 'storage_state.dart';

class StorageCubit extends Cubit<StorageState> {
  final UploadToStorage upload;
  final AddPromo addPromo;
  final AddMenu addMenu;
  final GetDownloadURL getDownload;
  StorageCubit(this.upload, this.addPromo, this.addMenu, this.getDownload)
      : super(StorageInitial());

  void uploadToStorage(String label, File file,
      {PromoEntity? promo, MenuEntity? menu}) async {
    emit(StorageLoading());
    await upload(label, file).then((value) async {
      emit(StorageSuccessful());
      if (label == 'promo') {
        await addPromo(promo!, await getDownload(label, file.path));
      } else {
        await addMenu(menu!, await getDownload(label, file.path));
      }
    });
  }
}

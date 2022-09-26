// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:loyalty_admin/domain/repository/repository.dart';

class UploadToStorage {
  final Repository repo;
  UploadToStorage({required this.repo});
  Future<void> call(String label, File file) async {
    await repo.uploadToStorage(label, file);
  }
}

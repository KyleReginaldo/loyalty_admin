// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:loyalty_admin/data/logic/remote_datasource.dart';
import 'package:loyalty_admin/data/model/menu_model.dart';
import 'package:loyalty_admin/data/model/promo_model.dart';
import 'package:loyalty_admin/domain/entity/customer_entity.dart';
import 'package:loyalty_admin/domain/entity/menu_entity.dart';
import 'package:loyalty_admin/domain/entity/promo_entity.dart';
import 'package:loyalty_admin/domain/entity/reservation_entity.dart';
import 'package:loyalty_admin/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDatasource remote;
  RepositoryImpl({required this.remote});
  @override
  Future<void> addMenu(MenuEntity menu, String image) async {
    await remote.addMenu(MenuModel.fromEntity(menu), image);
  }

  @override
  Future<void> addPromo(PromoEntity promo, String image) async {
    await remote.addPromo(PromoModel.fromEntity(promo), image);
  }

  @override
  Stream<List<CustomerEntity>> getCustomer() {
    return remote.getCustomer();
  }

  @override
  Stream<List<ReservationEntity>> getReservation() {
    return remote.getReservation();
  }

  @override
  Future<void> uploadToStorage(String label, File file) async {
    await remote.uploadToStorage(label, file);
  }

  @override
  Future<String> getDownloadUrl(String label, String path) async {
    return await remote.getDownloadUrl(label, path);
  }
}

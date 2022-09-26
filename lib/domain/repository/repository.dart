import 'dart:io';

import 'package:loyalty_admin/domain/entity/customer_entity.dart';
import 'package:loyalty_admin/domain/entity/menu_entity.dart';
import 'package:loyalty_admin/domain/entity/promo_entity.dart';
import 'package:loyalty_admin/domain/entity/reservation_entity.dart';

abstract class Repository {
  Stream<List<CustomerEntity>> getCustomer();
  Stream<List<ReservationEntity>> getReservation();
  Future<void> addPromo(PromoEntity promo, String image);
  Future<void> addMenu(MenuEntity menu, String image);
  Future<void> uploadToStorage(String label, File file);
  Future<String> getDownloadUrl(String label, String path);
}

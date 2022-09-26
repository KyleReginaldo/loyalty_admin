import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:loyalty_admin/data/model/customer_model.dart';
import 'package:loyalty_admin/data/model/menu_model.dart';
import 'package:loyalty_admin/data/model/promo_model.dart';
import 'package:loyalty_admin/data/model/reservation_mode.dart';

abstract class RemoteDatasource {
  Stream<List<CustomerModel>> getCustomer();
  Stream<List<ReservationModel>> getReservation();
  Future<void> addPromo(PromoModel promo, String image);
  Future<void> addMenu(MenuModel menu, String image);
  Future<void> uploadToStorage(String label, File file);
  Future<String> getDownloadUrl(String label, String path);
}

class RemoteDatasourceImpl implements RemoteDatasource {
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  late ReservationModel reservation;
  @override
  Future<String> getDownloadUrl(String label, String path) async {
    String downloadUrl = await storage.ref('$label/$path').getDownloadURL();
    print('downloadUrl: $downloadUrl');
    return downloadUrl;
  }

  @override
  Future<void> addMenu(MenuModel menu, String image) async {
    final docUser = db.collection('menu').doc();
    menu.uid = docUser.id;
    menu.image = image;
    await docUser.set(menu.toMap());
  }

  @override
  Future<void> addPromo(PromoModel promo, String image) async {
    final docUser = db.collection('promo').doc();
    promo.uid = docUser.id;
    promo.image = image;
    await docUser.set(promo.toMap());
  }

  @override
  Stream<List<CustomerModel>> getCustomer() {
    return db.collection('customer').snapshots().map((event) =>
        event.docs.map((e) => CustomerModel.fromMap(e.data())).toList());
  }

  @override
  Stream<List<ReservationModel>> getReservation() {
    return db
        .collection('reservation')
        .snapshots()
        .map((event) => event.docs.map((e) {
              return ReservationModel.fromMap(e.data());
            }).toList());
  }

  @override
  Future<void> uploadToStorage(String label, File file) async {
    await storage.ref('$label/${file.path}').putFile(file);
  }
}

// register customer ----
// await docUser.set({
//   "firstname": customer.firstname,
//   "lastname": customer.lastname,
//   "address": customer.address,
//   "streetAddress": customer.streetAddress,
//   "stressAddress2": customer.stressAddress2,
//   "city": customer.city,
//   "state": customer.state,
//   "contact": customer.contact,
//   "birthdate": customer.birthdate,
//   "email": customer.email,
//   "password": customer.password,
// });
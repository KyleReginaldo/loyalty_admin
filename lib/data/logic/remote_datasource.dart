import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loyalty_admin/data/model/customer_model.dart';
import 'package:loyalty_admin/data/model/menu_model.dart';
import 'package:loyalty_admin/data/model/promo_model.dart';
import 'package:loyalty_admin/data/model/reservation_mode.dart';

abstract class RemoteDatasource {
  Stream<List<CustomerModel>> getCustomer();
  Stream<List<ReservationModel>> getReservation();
  Future<void> addPromo(PromoModel promo);
  Future<void> addMenu(MenuModel menu);
}

class RemoteDatasourceImpl implements RemoteDatasource {
  final db = FirebaseFirestore.instance;
  @override
  Future<void> addMenu(MenuModel menu) async {
    final docUser = db.collection('menu').doc();
    menu.uid = docUser.id;
    await docUser.set(menu.toMap());
  }

  @override
  Future<void> addPromo(PromoModel promo) async {
    final docUser = db.collection('promo').doc();
    promo.uid = docUser.id;
    await docUser.set(promo.toMap());
  }

  @override
  Stream<List<CustomerModel>> getCustomer() {
    return db.collection('customer').snapshots().map((event) =>
        event.docs.map((e) => CustomerModel.fromMap(e.data())).toList());
  }

  @override
  Stream<List<ReservationModel>> getReservation() {
    return db.collection('reservation').snapshots().map((event) =>
        event.docs.map((e) => ReservationModel.fromMap(e.data())).toList());
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
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:loyalty_admin/domain/entity/reservation_entity.dart';

import '../../domain/entity/customer_entity.dart';

class ReservationModel extends ReservationEntity {
  ReservationModel copyWith({
    String? uid,
    String? guest,
    String? date,
    String? time,
    CustomerEntity? customer,
  }) {
    return ReservationModel(
      uid: uid ?? this.uid,
      guest: guest ?? this.guest,
      date: date ?? this.date,
      time: time ?? this.time,
      customer: customer ?? this.customer,
    );
  }

  const ReservationModel({
    super.uid,
    required super.guest,
    required super.date,
    required super.time,
    required super.customer,
  });

  factory ReservationModel.fromEntity(ReservationEntity reserve) {
    return ReservationModel(
      uid: reserve.uid,
      guest: reserve.guest,
      date: reserve.date,
      time: reserve.time,
      customer: reserve.customer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'guest': guest,
      'date': date,
      'time': time,
      'customer': customer,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      uid: map['uid'],
      guest: map['guest'],
      date: map['date'],
      time: map['time'],
      customer: map['customer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationModel.fromJson(String source) =>
      ReservationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

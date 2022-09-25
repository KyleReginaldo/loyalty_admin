import 'dart:convert';
import 'package:loyalty_admin/domain/entity/reservation_entity.dart';

class ReservationModel extends ReservationEntity {
  const ReservationModel({
    super.uid,
    required super.guest,
    required super.date,
    required super.time,
  });

  factory ReservationModel.fromEntity(ReservationEntity reserve) {
    return ReservationModel(
      uid: reserve.uid,
      guest: reserve.guest,
      date: reserve.date,
      time: reserve.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'guest': guest,
      'date': date,
      'time': time,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      uid: map['uid'],
      guest: map['guest'],
      date: map['date'],
      time: map['time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationModel.fromJson(String source) =>
      ReservationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

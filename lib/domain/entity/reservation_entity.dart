// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ReservationEntity extends Equatable {
  final String? uid;
  final String guest;
  final String date;
  final String time;
  const ReservationEntity({
    this.uid,
    required this.guest,
    required this.date,
    required this.time,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}

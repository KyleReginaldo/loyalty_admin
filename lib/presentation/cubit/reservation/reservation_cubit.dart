// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:loyalty_admin/domain/entity/reservation_entity.dart';
import 'package:loyalty_admin/domain/usecase/get_reservation.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final GetReservation getReservation;

  ReservationCubit(
    this.getReservation,
  ) : super(ReservationInitial());
  void fetchReservation() {
    final reservation = getReservation();
    reservation.listen((event) {
      if (event.isEmpty) {
        emit(ReservationEmpty());
      } else {
        emit(ReservationLoaded(reservation: event));
      }
    });
  }
}

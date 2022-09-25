// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reservation_cubit.dart';

abstract class ReservationState extends Equatable {
  const ReservationState();

  @override
  List<Object> get props => [];
}

class ReservationInitial extends ReservationState {}

class ReservationLoading extends ReservationState {}

class ReservationLoaded extends ReservationState {
  final List<ReservationEntity> reservation;
  const ReservationLoaded({required this.reservation});
}

class ReservationEmpty extends ReservationState {}

class ReservationError extends ReservationState {}

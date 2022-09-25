// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:loyalty_admin/domain/entity/reservation_entity.dart';
import 'package:loyalty_admin/domain/repository/repository.dart';

class GetReservation {
  final Repository repo;
  GetReservation({required this.repo});
  Stream<List<ReservationEntity>> call() {
    return repo.getReservation();
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:loyalty_admin/domain/entity/customer_entity.dart';
import 'package:loyalty_admin/domain/repository/repository.dart';

class GetCustomer {
  final Repository repo;
  GetCustomer({required this.repo});
  Stream<List<CustomerEntity>> call() {
    return repo.getCustomer();
  }
}

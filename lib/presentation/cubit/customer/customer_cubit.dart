import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyalty_admin/domain/entity/customer_entity.dart';
import 'package:loyalty_admin/domain/usecase/get_customer.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  final GetCustomer getCustomer;
  CustomerCubit(this.getCustomer) : super(CustomerInitial());

  void fetchCustomer() {
    emit(CustomerLoading());
    final customer = getCustomer();
    customer.listen((event) {
      if (event.isEmpty) {
        emit(CustomerEmpty());
      } else {
        emit(CustomerLoaded(customer: event));
      }
    });
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'customer_cubit.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object> get props => [];
}

class CustomerInitial extends CustomerState {}

class CustomerLoading extends CustomerState {}

class CustomerLoaded extends CustomerState {
  final List<CustomerEntity> customer;
  const CustomerLoaded({required this.customer});
}

class CustomerEmpty extends CustomerState {}

class CustomerError extends CustomerState {}

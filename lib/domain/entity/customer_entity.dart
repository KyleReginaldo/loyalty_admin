// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  final String? uid;
  final String firstname;
  final String lastname;
  final String address;
  final String streetAddress;
  final String stressAddress2;
  final String city;
  final String state;
  final String contact;
  final String birthdate;
  final String email;
  final String password;
  const CustomerEntity({
    this.uid,
    required this.firstname,
    required this.lastname,
    required this.address,
    required this.streetAddress,
    required this.stressAddress2,
    required this.city,
    required this.state,
    required this.contact,
    required this.birthdate,
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => throw UnimplementedError();
}

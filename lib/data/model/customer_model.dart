// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:loyalty_admin/domain/entity/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  const CustomerModel({
    required super.uid,
    required super.firstname,
    required super.lastname,
    required super.address,
    required super.streetAddress,
    required super.stressAddress2,
    required super.city,
    required super.state,
    required super.contact,
    required super.birthdate,
    required super.email,
    required super.password,
  });

  factory CustomerModel.fromEntity(CustomerEntity customer) {
    return CustomerModel(
      uid: customer.uid,
      firstname: customer.firstname,
      lastname: customer.lastname,
      address: customer.address,
      streetAddress: customer.streetAddress,
      stressAddress2: customer.stressAddress2,
      city: customer.city,
      state: customer.state,
      contact: customer.contact,
      birthdate: customer.birthdate,
      email: customer.email,
      password: customer.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'firstname': firstname,
      'lastname': lastname,
      'address': address,
      'streetAddress': streetAddress,
      'stressAddress2': stressAddress2,
      'city': city,
      'state': state,
      'contact': contact,
      'birthdate': birthdate,
      'email': email,
      'password': password,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      uid: map['uid'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      address: map['address'],
      streetAddress: map['streetAddress'],
      stressAddress2: map['stressAddress2'],
      city: map['city'],
      state: map['state'],
      contact: map['contact'],
      birthdate: map['birthdate'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

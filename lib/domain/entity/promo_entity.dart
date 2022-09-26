// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PromoEntity extends Equatable {
  String? uid;
  final String title;
  final String description;
  String image;
  PromoEntity({
    this.uid,
    required this.title,
    required this.description,
    this.image = '',
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}

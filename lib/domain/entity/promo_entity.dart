// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PromoEntity extends Equatable {
  String? uid;
  final String title;
  final String description;
  final String image;
  PromoEntity({
    this.uid,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}

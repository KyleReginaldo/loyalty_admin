// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:loyalty_admin/domain/entity/promo_entity.dart';

class PromoModel extends PromoEntity {
  PromoModel({
    super.uid,
    required super.title,
    required super.description,
    super.image,
  });

  factory PromoModel.fromEntity(PromoEntity promo) {
    return PromoModel(
      uid: promo.uid,
      title: promo.title,
      description: promo.description,
      image: promo.image = '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'title': title,
      'description': description,
      'image': image,
    };
  }

  factory PromoModel.fromMap(Map<String, dynamic> map) {
    return PromoModel(
      uid: map['uid'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PromoModel.fromJson(String source) =>
      PromoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

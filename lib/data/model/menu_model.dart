// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:loyalty_admin/domain/entity/menu_entity.dart';

class MenuModel extends MenuEntity {
  MenuModel({
    super.uid,
    required super.title,
    required super.description,
    required super.categories,
    required super.price,
    required super.image,
  });

  factory MenuModel.fromEntity(MenuEntity menu) {
    return MenuModel(
      uid: menu.uid,
      title: menu.title,
      description: menu.description,
      categories: menu.categories,
      price: menu.price,
      image: menu.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'title': title,
      'description': description,
      'categories': categories,
      'price': price,
      'image': image,
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      uid: map['uid'],
      title: map['title'],
      description: map['description'],
      categories: map['categories'],
      price: map['price'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) =>
      MenuModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

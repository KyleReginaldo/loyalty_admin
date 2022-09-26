// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:loyalty_admin/domain/entity/menu_entity.dart';
import 'package:loyalty_admin/domain/repository/repository.dart';

class AddMenu {
  final Repository repo;
  AddMenu({required this.repo});
  Future<void> call(MenuEntity menu, String image) async {
    await repo.addMenu(menu, image);
  }
}

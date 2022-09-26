// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:loyalty_admin/domain/entity/promo_entity.dart';
import 'package:loyalty_admin/domain/repository/repository.dart';

class AddPromo {
  final Repository repo;
  AddPromo({required this.repo});
  Future<void> call(PromoEntity promo, image) async {
    await repo.addPromo(promo, image);
  }
}

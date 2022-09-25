import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyalty_admin/domain/entity/promo_entity.dart';
import 'package:loyalty_admin/domain/usecase/add_promo.dart';

part 'promo_state.dart';

class PromoCubit extends Cubit<PromoState> {
  final AddPromo addpromo;
  PromoCubit(this.addpromo) : super(PromoInitial());
  void addPromo(PromoEntity promo) async {
    await addpromo(promo);
  }
}

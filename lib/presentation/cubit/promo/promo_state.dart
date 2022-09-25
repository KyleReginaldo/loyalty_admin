part of 'promo_cubit.dart';

abstract class PromoState extends Equatable {
  const PromoState();

  @override
  List<Object> get props => [];
}

class PromoInitial extends PromoState {}

class PromoLoading extends PromoState {}

class PromoLoaded extends PromoState {}

class PromoEmpty extends PromoState {}

class PromoError extends PromoState {}

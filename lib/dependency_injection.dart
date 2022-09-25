import 'package:get_it/get_it.dart';
import 'package:loyalty_admin/data/logic/remote_datasource.dart';
import 'package:loyalty_admin/data/repository/repository_impl.dart';
import 'package:loyalty_admin/domain/repository/repository.dart';
import 'package:loyalty_admin/domain/usecase/add_menu.dart';
import 'package:loyalty_admin/domain/usecase/add_promo.dart';
import 'package:loyalty_admin/domain/usecase/get_customer.dart';
import 'package:loyalty_admin/domain/usecase/get_reservation.dart';
import 'package:loyalty_admin/presentation/cubit/customer/customer_cubit.dart';
import 'package:loyalty_admin/presentation/cubit/menu/menu_cubit.dart';
import 'package:loyalty_admin/presentation/cubit/promo/promo_cubit.dart';
import 'package:loyalty_admin/presentation/cubit/reservation/reservation_cubit.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => CustomerCubit(sl()));
  sl.registerFactory(() => ReservationCubit(sl()));
  sl.registerFactory(() => PromoCubit(sl()));
  sl.registerFactory(() => MenuCubit(sl()));

  sl.registerLazySingleton(() => GetCustomer(repo: sl()));
  sl.registerLazySingleton(() => GetReservation(repo: sl()));
  sl.registerLazySingleton(() => AddMenu(repo: sl()));
  sl.registerLazySingleton(() => AddPromo(repo: sl()));

  sl.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImpl());

  sl.registerLazySingleton<Repository>(() => RepositoryImpl(remote: sl()));
}

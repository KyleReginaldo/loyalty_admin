import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyalty_admin/domain/entity/menu_entity.dart';
import 'package:loyalty_admin/domain/usecase/add_menu.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final AddMenu addmenu;
  MenuCubit(this.addmenu) : super(MenuInitial());

  void addMenu(MenuEntity menu) async {
    emit(MenuLoading());
    await addmenu(menu);
  }
}

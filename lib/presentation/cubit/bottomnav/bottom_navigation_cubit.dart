import 'package:bloc/bloc.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationInitial> {
  BottomNavigationCubit() : super(BottomNavigationInitial(index: 0));

  void navigate(int index) {
    emit(BottomNavigationInitial(index: index));
  }
}

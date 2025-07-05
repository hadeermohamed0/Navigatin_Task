import 'package:bloc/bloc.dart';
part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavInitial());

  void changeTab(int index) {
    switch (index) {
      case 0:
        emit(NavInitial());
        break;
      case 1:
        emit(NavPage2());
        break;
      case 2:
        emit(NavPage3());
        break;
      case 3:
        emit(NavPage1_1());
        break;
      case 4:
        emit(NavPage2_2());
        break;
      case 5:
        emit(NavPage3_3());
        break;
      default:
        emit(NavInitial());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottomnavcubit_state.dart';

class BottomnavcubitCubit extends Cubit<int> {
  BottomnavcubitCubit() : super(0);
  void updateIndex(int index) => emit(index);

  /// for navigation button on single page
  void gethome_page() => emit(0);
  void getchat() => emit(1);
  void getphoto() => emit(2);
  void getNotification() => emit(3);
  void getMore() => emit(4);
}

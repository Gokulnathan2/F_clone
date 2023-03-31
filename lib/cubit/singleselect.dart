import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class singleselect extends Cubit<Color> {
  singleselect() : super(Colors.white);
  void Theme() {
    if (state == ThemeData.dark()) {
      emit(Colors.white);
    } else {
      emit(Colors.red);
    }
  }
}

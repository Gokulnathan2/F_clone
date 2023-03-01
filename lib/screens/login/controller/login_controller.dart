import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gokul_f/model/login_model.dart';

import '../../../model/login_response_model.dart';
import '../../../services/login_services.dart';
// import '../model/login_model.dart';
// import '../model/login_response_model.dart';
// import '../service/login_service.dart';

part 'state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.service}) : super(const LoginInitial());

  LoginService service;

  Future<void> onPressedLogin(TextEditingController emailController,
      TextEditingController passwordController) async {
    emit(LoginLoading());

    final model = LoginModel(
      email: emailController.text,
      password: passwordController.text,
      // category: null,
      // types: null,
      // domains: null,
    );

    final response = await service.loginService(model);
    //  print(response['domains']);
    print("Login controller: response ${json.encode(response)}");
    // print(response);
    //return response;
    if (response is LoginResponseModel) {
      if (response.error != '') {
        print("token is available: ");
        print(response.token!);
        LoginService.storeToken(response.token!);
        //LoginService.getToken(response.token!);
        emit(LoginCompleted(response));
      } else {
        print("error encountered");
        emit(LoginError("Error encountered while login"));
      }
    } else {
      // emit(LoginError('Error'));
      emit(LoginInitial());
    }
  }
}

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/bloc/auth_event.dart';
import 'package:gokul_f/bloc/auth_state.dart';
import 'package:gokul_f/repository/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthRepository repo;
  AuthBloc(AuthState initialState, this.repo) : super(initialState);
  @override
//   on<LoginButtonPressed>((event,emit)async{
// });
  Stream<AuthState> mapEventToState(AuthEvents event) async* {
    final storage = FlutterSecureStorage();
    var pref = await SharedPreferences.getInstance();
    if (event is StartEvent) {
      yield LoginInitState();
    } else if (event is LoginButtonPressed) {
      yield LoginLogingState();
      try {
        final token = await AuthRepository().login(event.email, event.password);
        await storage.write(key: 'token', value: token);
        print(token);
      } catch (error) {
        // yield LoginErrorState(error: error.toString());
      }

      // var data = await repo.login(event.email, event.password);
      //var rsc = await repo.login(res.statuscode);
      // if (data['category'] == 'Customer') {
      //   // Future<void> storeToken(String token) async {
      //   //   await storage.write(key: "token", value: data['token']);
      //   // }

      //   // Future<String?> getToken(String token) async {
      //   //   return await storage.read(key: "token");
      //   // }
      //   pref.setString("token", data['token']);

      //   pref.setString("token", data['type']);
      //   pref.setString("email", data['email']);
      yield UserLoginSuccessState();
    } else if (['types'] == 'Manager') {
      yield AdminLoginSuccessState();
    } else {
      // yield LoginErrorState(message: 'auth err');
    }
  }
}
// //}
// class AuthenticationBloc
//     extends Bloc<AuthenticationEvent, AuthenticationState> {
//   final UserRepositories userRepositories;
//   AuthenticationBloc({required this.userRepositories})
//       : assert(userRepositories != null),
//         super(AuthenticationUninitialized());

//   @override
//   AuthenticationState get initialState => AuthenticationUninitialized();
//   @override
//   Stream<AuthenticationState> mapEventTOState(
//     AuthenticationEvent event,
//   ) async* {
//     if (event is Appstarted) {
//       final bool hasToken = await userRepositories.hasToken();
//       if (hasToken) {
//         yield AuthenticationAuthenticated();
//       } else {
//         yield AuthenticationUnauthenticated();
//       }
//     }
//     if (event is LoggedIn) {
//       yield AuthenticationLoading();
//       await UserRepositories().persisteToken(event.token);
//       yield AuthenticationAuthenticated();
//     }
//     if (event is LoggedOut) {
//       yield AuthenticationLoading();
//       await userRepositories.deleteToken();
//       yield AuthenticationUnauthenticated();
//     }
//   }
// }

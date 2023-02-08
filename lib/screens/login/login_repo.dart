// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gokul_f/bloc/auth_bloc.dart';
// import 'package:gokul_f/login_bloc.dart/login_bloc.dart';
// import 'package:gokul_f/repository/auth_repo.dart';
// import 'package:gokul_f/screens/login/login_page.dart';

// class LoginRepo extends StatelessWidget {
//   final UserRepositories userRepositories;
//   LoginRepo({required Key key, required this.userRepositories})
//       : assert(userRepositories != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) {
//           return LoginBloc(
//               userRepositories: userRepositories,
//               authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
//         },
//         child: LoginScreen(
//           userRepositories: userRepositories,
//         ),
//       ),
//     );
//   }
// }

// // import 'package:admin/common/widgets/error_dialog.dart';
// // import 'package:admin/modules/onboarding/firebase/repo/auth_repository.dart';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import '../model/custom_error.dart';
// import '../repository/auth_repo.dart';
// part  '../login_bloc.dart/signin_state.dart';
// //import '../../firebase/models/custom_error.dart';



// class SigninCubit extends Cubit<SigninState> {
//   final AuthRepository authRepository;
//   SigninCubit({required this.authRepository}) : super(SigninState.initial());

//   Future<void> signin({
//     required BuildContext context,
//     required String email,
//     required String password,
//   }) async {
//     emit(state.copyWith(signinStatus: SigninStatus.submitting));

//     try {
//       await authRepository.repo(email: email, password: password);

//       emit(state.copyWith(signinStatus: SigninStatus.success));
//     } on CustomError catch (e) {
//       errorDialog(context, e.message);
//       emit(
//         state.copyWith(
//           signinStatus: SigninStatus.error,
//           error: e,
//         ),
//       );
//     }
//   }

//   void onLogin(BuildContext context) async {
//     if (state.formKey.currentState!.validate()) {
//       signin(
//           context: context,
//           email: state.emailController.text,
//           password: state.passwordController.text);
//     }
//   }

//   void togleEye(bool isPasswordVisible) {
//     emit(state.copyWith(ispasswordVisible: isPasswordVisible));
//   }
// }

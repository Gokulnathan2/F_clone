// part of 'signin_cubit.dart';

// enum SigninStatus {
//   initial,
//   submitting,
//   success,
//   error,
// }

// class SigninState extends Equatable {
//   final SigninStatus signinStatus;
//   final CustomError error;
//   final TextEditingController emailController;
//   final TextEditingController passwordController;
//   final GlobalKey<FormState> formKey;
//   final bool ispasswordVisible;
//   final String email;
//   final String password;
//   final bool submitted;

//   SigninState({
//     required this.signinStatus,
//     required this.passwordController,
//     required this.error,
//     required this.emailController,
//     required this.ispasswordVisible,
//     required this.formKey,
//     required this.email,
//     required this.password,
//     required this.submitted,
//   });

//   factory SigninState.initial() {
//     return SigninState(
//       email: '',
//       password: '',
//       formKey: GlobalKey<FormState>(),
//       emailController: TextEditingController(),
//       ispasswordVisible: false,
//       passwordController: TextEditingController(),
//       signinStatus: SigninStatus.initial,
//       error: CustomError(),
//       submitted: false,
//     );
//   }

//   SigninState copyWith(
//       {SigninStatus? signinStatus,
//       CustomError? error,
//       TextEditingController? emailController,
//       TextEditingController? passwordController,
//       GlobalKey<FormState>? formKey,
//       bool ispasswordVisible = false,
//       bool submitted = false,
//       String? email,
//       String? password}) {
//     return SigninState(
//         signinStatus: signinStatus ?? this.signinStatus,
//         error: error ?? this.error,
//         emailController: emailController ?? this.emailController,
//         passwordController: passwordController ?? this.passwordController,
//         formKey: formKey ?? this.formKey,
//         ispasswordVisible: ispasswordVisible,
//         email: email ?? this.email,
//         password: password ?? this.password,
//         submitted: submitted);
//   }

//   @override
//   List<Object> get props {
//     return [
//       signinStatus,
//       error,
//       emailController,
//       passwordController,
//       formKey,
//       ispasswordVisible,
//       email,
//       password,
//       submitted
//     ];
//   }
// }

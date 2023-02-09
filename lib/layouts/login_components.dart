// //part of '../login_page.dart';

// // import 'package:gokul_f/screens/login/login_page.dart';

// //part of '../screens/login/login_page.dart';
// //import '../screens/login/login_page.dart';
// part of '../screens/login/view/login_view.dart';

// //part '../screens/login/view/login_view.dart';
// //part of '../login_view.dart';

// extension SnackBarWidget on LoginView {
//   ScaffoldFeatureController buildSnackBar(BuildContext context, String text) {
//     return ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(text)));
//   }
// }

// extension TextFieldWidget on LoginView {
//   Widget buildTextField(TextEditingController controller) {
//     return Container(
//       width: 333,
//       child: TextFormField(
//           controller: controller,
//           autocorrect: false,
//           // validator: validator,
//           textAlign: TextAlign.center,
//           decoration: InputDecoration(
//             contentPadding:
//                 EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//             fillColor: Colors.white,
//             filled: true,
//             hintText: "Username",
//             helperText: '',
//             border: const OutlineInputBorder(),
//           ),
//           validator: (value) {
//             bool emailValid =
//                 RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
//                     .hasMatch(value!);
//             if (value!.isEmpty) {
//               return "Enter email id";
//             } else if (!emailValid) {
//               return "Enter valid email";
//             }
//           }),
//     );
//   }
// }

// extension TextFieldWidgets on LoginView {
//   Widget buildTextPassField(TextEditingController controller) {
//     return Container(
//       width: 333,
//       child: TextFormField(
//         controller: controller,
//         // validator: passvalidator,
//         // obscureText: passToggle,
//         textAlign: TextAlign.center,
//         decoration: InputDecoration(
//           contentPadding:
//               EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//           fillColor: Colors.white,
//           filled: true,
//           hintText: "Password",
//           helperText: '',
//           border: const OutlineInputBorder(),
//           // suffix: InkWell(
//           //   onTap: () {
//           //     // setState(() {
//           //     //   passToggle = !passToggle;
//           //     // });
//           //   },
//           //   child: Icon(passToggle
//           //       ? Icons.visibility
//           //       : Icons.visibility_off),
//           // ),
//         ),
//         validator: (value) {
//           if (value!.isEmpty) {
//             return "Enter password";
//           } else if (controller.text.length < 6) {
//             return "Password length is too short";
//           }
//         },
//       ),
//     );
//   }
// }

// extension LoginButton on LoginView {
//   Widget buildButton(BuildContext context, LoginState state) {
//     return Container(
//       width: 333,
//       height: 40,
//       child: ElevatedButton(
//         onPressed: () => buildOnPressed(context),
//         child: buildChild(state),
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(const Color(0xFFF55600)),
//           // primary: Colors.puwhiple,
//         ),
//       ),
//     );
//   }

//   Future<void> buildOnPressed(BuildContext context) async {
//     if (formKey.currentState!.validate()) {
//       context
//           .read<LoginCubit>()
//           .onPressedLogin(emailController, passwordController);
//     }
//   }

//   Widget buildChild(LoginState state) {
//     return state is LoginLoading
//         ? CircularProgressIndicator.adaptive()
//         : Text('Login');
//   }
// }

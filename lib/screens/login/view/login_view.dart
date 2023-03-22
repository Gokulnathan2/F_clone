import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/core/constants/api.dart';
import 'package:gokul_f/layouts/icon.dart';
import 'package:gokul_f/model/login_response_model.dart';
import 'package:gokul_f/screens/login/environment_screen.dart';

import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../../services/login_services.dart';

import '../../../services/network_handler.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  late Box box1;
  bool isChecked = false;
  bool passToggle = true;
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  static final storage = FlutterSecureStorage();
  @override
  void initState() {
    // authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
    createBox();
  }

  void createBox() async {
    box1 = await Hive.openBox('login date');
    getdata();
  }

  void getdata() async {
    if (box1.get('email') != null) {
      emailController.text = box1.get('email');
      isChecked = true;
      setState(() {});
    }
    if (box1.get('pass') != null) {
      passwordController.text = box1.get('pass');
      isChecked = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //appBar: buildAppBar,
      body: buildBody,
    );
  }

  //AppBar get buildAppBar => AppBar(title: Text('Appbar'));
  Widget get buildBody {
    return BlocProvider(
      create: buildBlocProvider,
      child: buildBlocConsumer,
    );
  }

  Widget get buildBlocConsumer {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: buildBlocListener,
      builder: (context, state) {
        // if (state is LoginLoading) {
        //   return Center(
        //     child: CircularProgressIndicator.adaptive(),
        //   );
        // }
        return buildForm(context, state);
      },
    );
  }

  LoginCubit buildBlocProvider(context) => LoginCubit(
        service: LoginService(
          service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
        ),
      );

  void buildBlocListener(context, state) {
    if (state is LoginCompleted) {
      final data = state.loginModel;
      print(data);
      if (data.error != null) {
        print('derr${data.error}');
        print('gogo');
        buildSnackBar(context, data.error!);
      } else {
        //  print('derr${data}');
        print("bloc listener: ${data.domains?.length}");

        // print(data);
        Navigator.of(context).pushReplacementNamed(
          '/environmentScreen',
          arguments: data.domains as List<DomainModel>,
        );
        buildSnackBar(context, 'Login Success!');
      }
    }
  }

  Widget buildForm(BuildContext context, LoginState state) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double text = MediaQuery.textScaleFactorOf(context);
    return Stack(
      children: <Widget>[
        Container(
          //alignment: Alignment(0, 0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/f_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // IconImg().icon(),
        //SizedBox(height: height / 30),
        //width: 333,
        SizedBox(height: 50),
        Form(
          key: formKey,
          child: Column(
            // IconImg().icon(),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconImg().icon(),
              SizedBox(height: height / 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: const Alignment(0, 30),
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                      "welcome back!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              buildTextField(emailController),
              SizedBox(height: 20),
              buildTextPassField(passwordController),
              Container(
                width: 333,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      //alignment: Alignment(1, 0),
                      child: Checkbox(
                        side: const BorderSide(
                          // set border color here
                          color: Colors.white,
                        ),
                        //  fillColor: MaterialStateProperty.resolveWith(),
                        value: isChecked,
                        onChanged: (value) {
                          isChecked = !isChecked;
                          setState(() {
                            // login();
                          });
                        },
                        //value: null,
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment(1, 0),
                    const Text(
                      'Remember me',
                      //textAlign: left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              buildButton(context, state),
              Container(
                //alignment: Alignment(0, 70),
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'or',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                //width: double.infinity,
                //alignment: Alignment(0, 80),
                width: 333,
                height: 40,
                child: ElevatedButton(
                  child: const Text('Log in With SSO'),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFF55600)),
                    // primary: Colors.puwhiple,
                  ),
                  //  child: Text(tlogin.toUppercase),
                ),
              ),
              SizedBox(height: 100),
              Container(
                //alignment: Alignment(0, -100),
                child: TextButton(
                  onPressed: () {
                    // setState(() {
                    Navigator.of(context).pushNamed('/forgotScreen');
                    // });
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // ),
      ],
    );
    //SizedBox(height: 20),
  }

  // extension TextFieldWidgets on LoginView {
  Widget buildTextField(TextEditingController controller) {
    return Container(
      width: 333,
      child: TextFormField(
          controller: controller,
          autocorrect: false,
          // validator: validator,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            fillColor: Colors.white,
            filled: true,
            hintText: "Username",
            helperText: '',
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            bool emailValid =
                RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                    .hasMatch(value!);
            if (value!.isEmpty) {
              return "Enter email id";
            } else if (!emailValid) {
              return "Enter valid email";
            }
          }),
    );
  }

  Widget buildTextPassField(TextEditingController controller) {
    return Container(
      width: 333,
      child: TextFormField(
        controller: controller,
        // validator: passvalidator,
        obscureText: passToggle,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          fillColor: Colors.white,
          filled: true,
          hintText: "Password",
          helperText: '',
          border: const OutlineInputBorder(),
          suffix: InkWell(
            onTap: () {
              setState(() {
                passToggle = !passToggle;
              });
            },
            child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter password";
          } else if (controller.text.length < 6) {
            return "Password length is too short";
          }
        },
      ),
    );
  }

  Widget buildButton(BuildContext context, LoginState state) {
    return Container(
      width: 333,
      height: 40,
      child: ElevatedButton(
        onPressed: () => buildOnPressed(context),
        child: buildChild(state),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFFF55600)),
          // primary: Colors.puwhiple,
        ),
      ),
    );
  }

  Future<void> buildOnPressed(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      print(emailController.text.toString());
      context
          .read<LoginCubit>()
          .onPressedLogin(emailController, passwordController);
      login();
      //LoginService.loginService.storeToken(["token"]);
    }
  }

  Widget buildChild(LoginState state) {
    return state is LoginLoading
        ? const CircularProgressIndicator.adaptive()
        : Text('Login');
  }

  ScaffoldFeatureController buildSnackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }

  void login() {
    if (isChecked) {
      box1.put('email', emailController.text);
      box1.put('pass', passwordController.text);
    }
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Simple Alert"),
      content: Text("This is an alert message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showNewVersionAvailableDialog(BuildContext context) {
    final alert = AlertDialog(
      title: Text("Error"),
      content: Text("There was an error during login."),
      actions: [ElevatedButton(child: Text("OK"), onPressed: () {})],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gokul_f/bloc/auth_bloc.dart';
import 'package:gokul_f/bloc/auth_events.dart';
import 'package:gokul_f/bloc/auth_state.dart';
//import 'package:gokul_f/screens/login/hive_login.dart';
import '../../layouts/icon.dart';
// import '../../layouts/pop_up.dart';
// import '../../layouts/raised_button.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:flutter/src/widgets/navigator.dart';
import '../../services/login_services.dart';
import '../forgot_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formfield = GlobalKey<FormState>();
  bool isChecked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool passToggle = true;
  late Box box1;
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
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
      passController.text = box1.get('pass');
      isChecked = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery.of(context).size.width;
    // double h = MediaQuery.of(context).size.height;
    final msg = BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoginErrorState) {
          return Text(state.message);
        } else if (state is LoginLogingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      },
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UserLoginSuccessState) {
            Navigator.pushNamed(context, '/forgotscreen');
          } else if (state is AdminLoginSuccessState) {
            Navigator.pushNamed(context, '/forgotscreen');
          }
        },
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/f_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 50),
            Form(
              key: _formfield,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconImg().icon(),

                  SizedBox(height: 60),
                  // IconImg().icon(),

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
                  SizedBox(height: 20),
                  Container(
                    // alignment: Alignment(0, 40),
                    width: 333,

                    child: TextFormField(
                      controller: emailController,
                      autocorrect: false,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Username",
                        helperText: '',
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        bool emailValid = RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                            .hasMatch(value!);
                        if (value!.isEmpty) {
                          return "Enter email id";
                        } else if (!emailValid) {
                          return "Enter valid email";
                        }
                      },
                    ),
                    // ),
                  ),
                  SizedBox(height: 30),

                  Container(
                    width: 333,
                    child: TextFormField(
                      controller: passController,
                      obscureText: passToggle,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
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
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter password";
                        } else if (passController.text.length < 6) {
                          return "Password length is too short";
                        }
                      },
                    ),
                  ),
                  // ),
                  // ),
                  SizedBox(height: 20),

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment(1, 0),
                        child: Checkbox(
                          side: const BorderSide(
                            // set border color here
                            color: Colors.white,
                          ),
                          //  fillColor: MaterialStateProperty.resolveWith(),
                          value: isChecked,
                          onChanged: (value) {
                            isChecked = !isChecked;
                            // setState(() {});
                          },
                          //value: null,
                        ),
                      ),
                      Container(
                        alignment: Alignment(1, 0),
                        child: Text(
                          'Remember me',
                          //textAlign: left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Container(
                    width: 333,
                    height: 40,
                    child: ElevatedButton(
                      child: const Text('Login'),

                      onPressed: () {
                        if (_formfield.currentState!.validate()) {
                          print("success");
                          login();
                          // emailController.clear();
                          // passController.clear();
                          authBloc.add(LoginButtonPressed(
                            email: emailController.text,
                            password: passController.text,
                          ));
                          print(emailController.text.toString());
                          print(passController.text.toString());

                          // LoginService().getres(emailController.text.toString(),
                          //     passController.text.toString());
                        }
                      }, //child: null,
                      // child: Text("Elevated Button with Icon"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFF55600)),
                        // primary: Colors.puwhiple,
                      ),
                      //  child: Text(tlogin.toUppercase),
                      // ),
                    ),
                  ),
                  // SizedBox(height: 20),
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
                  // SizedBox(height: 20),
                  Container(
                    //width: double.infinity,
                    //alignment: Alignment(0, 80),
                    width: 333,
                    height: 40,
                    child: ElevatedButton(
                      child: const Text('Log in With SSO'),
                      onPressed: () {}, //child: null,
                      // child: Text("Elevated Button with Icon"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFF55600)),
                        // primary: Colors.puwhiple,
                      ),
                      //  child: Text(tlogin.toUppercase),
                    ),
                  ),
                  SizedBox(height: 110),

                  // child: Column(
                  //                     mainAxisAlignment: MainAxisAlignment.end,
                  // children: [
                  Container(
                    //alignment: Alignment(0, -100),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pushNamed('/forgotScreen');
                        });
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // ],
                  // ),
                  //),
                  //  child: Text()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    if (isChecked) {
      box1.put('email', emailController.text);
      box1.put('pass', passController.text);
    }
  }
}

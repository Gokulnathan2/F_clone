//import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../layouts/icon.dart';

//import '../../services/login_services.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _formfield = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery.of(context).size.width;
    // double h = MediaQuery.of(context).size.height;
    //
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
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
          SafeArea(
            child: Container(
              // child: Positioned(
              //child: AppBar(

              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              //   backgroundColor: Colors.transparent,
              //   elevation: 0.0,
              // ),
              // ),
            ),
          ),
          IconImg().icon(),
          SizedBox(height: 114),
          Form(
            key: _formfield,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: const Alignment(0, 30),
                      padding: const EdgeInsets.all(20.0),
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 290,
                      // alignment: const Alignment(0, 30),
                      // padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Enter your email and we'll send you a link to reset your password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 333,

                  child: TextFormField(
                    controller: emailController,
                    autocorrect: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Email",
                      helperText: '',
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      bool emailValid = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w]{2}")
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
                SizedBox(height: 20),
                Container(
                  width: 333,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text('submit'),

                    onPressed: () {
                      if (_formfield.currentState!.validate()) {
                        print("success");

                        print(emailController.text.toString());
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  //RaisedButton({required Text child, required Null Function() onPressed}) {}
}

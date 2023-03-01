//import 'dart:ffi';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../layouts/icon.dart';

//import '../../services/login_services.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _formfield = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  bool _isLoading = false;
  late String _errorMessage;

  Future<void> _resetPassword() async {
    setState(() {
      _isLoading = true;
      //   _errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse('https://devapifyxt.com/v1/password/reset/'),
        body: json.encode({'email': emailController.text}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Password reset successfully
        print('ss');
        Navigator.of(context).pushNamed('/resetScreen');
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Password Reset'),
            content: Text(
                'An email has been sent to your email address with instructions to reset your password.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      } else {
        // Password reset failed
        Navigator.of(context).pushNamed('/resetScreen');
        print(response.statusCode);
      }
    } catch (error) {
      print(error);
      setState(() => _errorMessage = 'An error occurred. Please try again.');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                Container(
                  width: 333,
                  height: 40,
                  child: ElevatedButton(
                    //child: const Text('submit'),
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : Text('Reset Password'),

                    onPressed: _isLoading ? null : _resetPassword,

                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFF55600)),
                      // primary: Colors.puwhiple,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

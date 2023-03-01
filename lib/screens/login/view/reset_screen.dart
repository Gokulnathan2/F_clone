//import 'dart:ffi';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../layouts/icon.dart';
//import '../../layouts/icon.dart';

//import '../../services/login_services.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final _formfield = GlobalKey<FormState>();

  TextEditingController passController = TextEditingController();
  TextEditingController conpassController = TextEditingController();
  bool passToggle = true;
  bool _isLoading = false;
  late String _errorMessage;
  Future<void> _resetPassword() async {
    setState(() {
      _isLoading = true;
      // _errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse('https://devapifyxt.com/v1/password/reset/'),
        body: json.encode({'email': passController.text}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Password reset successfully
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
        final data = json.decode(response.body) as Map<String, dynamic>;
        setState(() => _errorMessage = data['message']);
      }
    } catch (error) {
      setState(() => _errorMessage = 'An error occurred. Please try again.');
    } finally {
      setState(() => _isLoading = false);
    }
  }

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
                        "Reset password",
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
                        "Please enter your new password",
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
                    controller: passController,
                    //buildTextField(passController),
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
                // SizedBox(height: 30),
                Container(
                  width: 333,
                  child: TextFormField(
                    controller: conpassController,
                    //buildTextField(passController),
                    obscureText: passToggle,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Confirm Password",
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
                //  SizedBox(height: 20),
                Container(
                  width: 333,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text('Submit'),

                    onPressed: () {
                      if (_formfield.currentState!.validate()) {
                        print("success");
                      }
                    },
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
}

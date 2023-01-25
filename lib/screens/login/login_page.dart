import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../layouts/icon.dart';
import '../../layouts/raised_button.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = true;
    return Scaffold(
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
          // SizedBox(height: 20),
          IconImg().icon(),
          // SizedBox(height: 10),
          SizedBox(height: 50),
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Container(
                //   color: Colors.white,
                //   height: 40,
                //   width: 333,

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

                  padding: const EdgeInsets.all(20.0),

                  // child: Container(
                  // color: Colors.white,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // ),
                ),
                //SizedBox(height: 20),
                // ),
                // Container(
                //   color: Colors.white,
                //   height: 40,
                //   width: 333,
                Container(
                  //alignment: Alignment(0, 50),

                  padding: const EdgeInsets.all(20.0),
                  // width: 333,
                  // height: 40,
                  // child: Container(
                  // color: Colors.white,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                // ),
                // ),
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.white,
                        //  fillColor: MaterialStateProperty.resolveWith(),
                        value: isChecked,
                        onChanged: (bool? value) {
                          // setState(() {
                          //   isChecked = value!;
                          // });
                        },
                        //value: null,
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                // SizedBox(height: 20),
                Container(
                  //width: double.infinity,
                  //padding: const EdgeInsets.all(20.0),
                  // alignment: Alignment(0, 60),
                  width: 333,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text('login'),
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
                    child: const Text('sign up'),
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
                //SizedBox(height: -0.2),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment(0, -100),
                      child: TextButton(
                        onPressed: () {},
                        child: Text('forget password?'),
                      ),
                    ),
                  ],
                ),
                //  child: Text()
              ],
            ),
          ),
        ],
      ),
    );
  }

  //RaisedButton({required Text child, required Null Function() onPressed}) {}
}

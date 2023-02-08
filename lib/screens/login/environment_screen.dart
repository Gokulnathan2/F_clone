//import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gokul_f/data/data.dart';
import 'package:gokul_f/repository/auth_repo.dart';
import '../../layouts/icon.dart';

//import '../../services/login_services.dart';

class EnvironmentScreen extends StatefulWidget {
  const EnvironmentScreen({super.key});

  @override
  State<EnvironmentScreen> createState() => _EnvironmentScreenState();
}

class _EnvironmentScreenState extends State<EnvironmentScreen> {
  final _formfield = GlobalKey<FormState>();
//final List<Map<String, dynamic>> data;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    //
    //var dataList=AuthRepository().login(datalst;
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
          // SizedBox(height: 50),
          // SafeArea(
          //   child: Container(
          //     // child: Positioned(
          //     //child: AppBar(

          //     child: IconButton(
          //       onPressed: () => Navigator.of(context).pop(),
          //       icon: Icon(
          //         Icons.arrow_back,
          //         color: Colors.white,
          //         size: 30,
          //       ),
          //     ),
          //     //   backgroundColor: Colors.transparent,
          //     //   elevation: 0.0,
          //     // ),
          //     // ),
          //   ),
          // ),
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
                        "Environment",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
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
                        "Choose which environment you want to enter",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 333,
                      height: 120,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(),
                        itemCount: dataList.length,
                        itemBuilder: (context, i, id) {
                          return GestureDetector(
                            child: Container(
                              width: 220,
                              height: 120,
                              alignment: Alignment(0, 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.white),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Text(
                                  dataList[i],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 333,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text('Enter'),

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

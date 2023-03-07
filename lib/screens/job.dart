import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/layouts/bottom_navigation_Screen.dart';
import 'package:gokul_f/layouts/icon.dart';
import 'package:gokul_f/screens/More_Menu_Screen.dart';
import 'package:gokul_f/screens/camera_screen.dart';
import 'package:gokul_f/screens/chat_screen.dart';
import 'package:gokul_f/screens/dashboard_screen.dart';
import 'package:gokul_f/screens/login/environment_screen.dart';
import 'package:gokul_f/screens/notifications_screen.dart';
import 'package:gokul_f/services/dashboard_services.dart';

import '../model/dash_board_model.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({Key? key}) : super(key: key);
  // final String? baseurls;
  // const DashBoardScreen({super.key, this.baseurls});
  @override
  State<JobScreen> createState() => _JobState();
}

class _JobState extends State<JobScreen> {
  static final storage = FlutterSecureStorage();
  // int selectedIndex = 0;
  // static List<Widget> selectedOption = <Widget>[
  //   DashBoardScreen(),
  //   ChatScreen(),
  //   CameraScreen(),
  //   NotificationScreen(),
  //   MenuScreen(),
  // ];
  // void _onItemTapped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Job Request',
        ),
        leading: (Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
          ],
        )),
        //   IconButton(

        //   //icon: const Icon(Icons.add_alert),
        //   tooltip: 'Show Snackbar',
        //   onPressed: () {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(content: Text('This is a snackbar')));
        //   },
        // )),

        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 4, 31, 68),
        //title: const Text('AppBar Demo'),
        actions: <Widget>[],
      ),
      // body: const Center(
      //   child: Text(
      //     'This is the home page',
      //     style: TextStyle(fontSize: 24),
      //   ),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed, // set the type property to fixed

      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.dashboard), label: 'Dashboard'),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat),
      //       label: 'Chat',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.camera_alt),
      //       label: 'Photo',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications),
      //       label: 'Notification',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.menu),
      //       label: 'More',
      //     )
      //   ],
      //   // type: BottomNavigationBarType.fixed,
      //   currentIndex: selectedIndex,
      //   selectedItemColor: Colors.orange[900],
      //   unselectedItemColor: Color.fromARGB(255, 1, 21, 88),
      //   iconSize: 23,
      //   onTap: _onItemTapped,
      //   elevation: 3,
      // ),
    );
  }
}

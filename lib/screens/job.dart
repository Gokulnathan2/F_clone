import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/layouts/icon.dart';
import 'package:gokul_f/screens/login/environment_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
        ),
        // leading: (Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Container(
        //       alignment: Alignment(2, 0),
        //       padding: EdgeInsets.all(2.0),
        //       height: 40,
        //       width: 40,
        //       child: Image.asset(
        //         "assets/f_logo.png",
        //         fit: BoxFit.fitWidth,
        //       ),
        //     )
        //   ],
        // )),
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
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

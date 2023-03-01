import 'package:flutter/material.dart';
import 'package:gokul_f/layouts/icon.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuState();
}

class _MenuState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment(2, 0),
              padding: EdgeInsets.all(2.0),
              height: 40,
              width: 40,
              child: Image.asset(
                "assets/f_logo.png",
                fit: BoxFit.fitWidth,
              ),
            )
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
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

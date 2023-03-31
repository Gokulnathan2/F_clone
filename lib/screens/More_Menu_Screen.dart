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
      body: Column(
        children: const [
          ListTile(
            title: Text(
              'Photo Bank',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 46, 83)),
            ),
            leading: Icon(
              Icons.insert_photo_outlined,
              color: Color.fromARGB(255, 1, 46, 83),
            ),
          ),
          ListTile(
            title: Text('Timesheet',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 1, 46, 83))),
            leading: Icon(Icons.pending_actions_sharp,
                color: Color.fromARGB(255, 1, 46, 83)),
          ),
          ListTile(
            title: Text('Profile',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 1, 46, 83))),
            leading: Icon(Icons.perm_contact_calendar_rounded,
                color: Color.fromARGB(255, 1, 46, 83)),
          ),
          ListTile(
            title: Text('Help Center',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 1, 46, 83))),
            leading: Icon(Icons.headset_mic_rounded,
                color: Color.fromARGB(255, 1, 46, 83)),
          ),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 46, 83)),
            ),
            leading:
                Icon(Icons.settings, color: Color.fromARGB(255, 1, 46, 83)),
          ),
        ],
      ),
    );
  }
}

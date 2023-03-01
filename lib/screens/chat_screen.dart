import 'package:flutter/material.dart';
import 'package:gokul_f/layouts/icon.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: (
        title: const Text(
          'chat',
          textAlign: TextAlign.center,
        ),
        // ),
        //   IconButton(

        //   //icon: const Icon(Icons.add_alert),
        //   tooltip: 'Show Snackbar',
        //   onPressed: () {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(content: Text('This is a snackbar')));
        //   },
        // )),

        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 231, 79, 52),
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

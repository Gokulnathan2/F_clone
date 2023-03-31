import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertWithIcon extends StatefulWidget {
  AlertWithIconWidget createState() => AlertWithIconWidget();
}

class AlertWithIconWidget extends State {
  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(children: [
            Image.network(
              'https://flutter-examples.com/wp-content/uploads/2019/12/android_icon.png',
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            Text('  Alert Dialog Title. ')
          ]),
          content: Text("Are You Sure Want To Proceed?"),
          actions: <Widget>[
            ElevatedButton(
              child: Text("YES"),
              onPressed: () {
                //Put your code here which you want to execute on Yes button click.
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("CANCEL"),
              onPressed: () {
                //Put your code here which you want to execute on Cancel button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

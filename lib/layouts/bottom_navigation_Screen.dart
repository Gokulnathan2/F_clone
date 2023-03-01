import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gokul_f/screens/More_Menu_Screen.dart';
import 'package:gokul_f/screens/camera_screen.dart';
import 'package:gokul_f/screens/chat_screen.dart';
import 'package:gokul_f/screens/dashboard_screen.dart';
import 'package:gokul_f/screens/notifications_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  static List<Widget> selectedOption = <Widget>[
    DashBoardScreen(),
    ChatScreen(),
    CameraScreen(),
    NotificationScreen(),
    MenuScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: selectedOption.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Photo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          )
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.orange[900],
        unselectedItemColor: Color.fromARGB(255, 1, 21, 88),
        iconSize: 23,
        onTap: _onItemTapped,
        elevation: 3,
      ),
    );
  }
}

import 'package:camera/camera.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gokul_f/screens/More_Menu_Screen.dart';
import 'package:gokul_f/screens/camera_screen.dart';
import 'package:gokul_f/screens/chat_screen.dart';
import 'package:gokul_f/screens/dashboard_screen.dart';
import 'package:gokul_f/screens/notifications_screen.dart';

class CusBottomNavigation extends StatefulWidget {
  const CusBottomNavigation({super.key});

  @override
  State<CusBottomNavigation> createState() => _CusBottomNavigationState();
}

class _CusBottomNavigationState extends State<CusBottomNavigation> {
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
    // return Scaffold(
    //   body: Center(
    //     child: selectedOption.elementAt(selectedIndex),
    //   ),
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.orange[900],
        inactiveColor: Color.fromARGB(255, 1, 21, 88),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'DashBoard',
          ),
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
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: DashBoardScreen(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ChatScreen(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CameraScreen(),
              );
            });
          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: NotificationScreen(),
              );
            });
          case 4:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: MenuScreen(),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: DashBoardScreen(),
              );
            });
        }
      },
    );
    //  );
  }
}

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gokul_f/cubit/bottomnav_cubit.dart';
import 'package:gokul_f/screens/More_Menu_Screen.dart';
import 'package:gokul_f/screens/camera_screen.dart';
import 'package:gokul_f/screens/chat_screen.dart';
import 'package:gokul_f/screens/dashboard_screen.dart';
import 'package:gokul_f/screens/notifications_screen.dart';
import 'package:flutter/cupertino.dart';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: BottomNavigation(),
      providers: [
        BlocProvider(create: (context) => BottomnavcubitCubit()),
        //BlocProvider(create: (context) => singleselect())
      ],
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
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
  // void _onItemTapped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavcubitCubit, int>(builder: (context, state) {
      return Scaffold(
        body: _buildBody(state),
        bottomNavigationBar: _buildBottomNav(),
      );
    });
  }

  Widget _buildBody(int index) {
    /// Check if index is in range
    /// else return Not Found widget
    ///
    return selectedOption.elementAt(index);
  }

  Widget _buildBottomNav() {
    // bottomNavigationBar: ClipRRect(
    //   borderRadius: BorderRadius.only(
    //     topLeft: Radius.circular(10),
    //     topRight: Radius.circular(10),
    //   ),
    //   child: Container(
    //     // height: 62,
    return BottomNavigationBar(
      currentIndex: context.read<BottomnavcubitCubit>().state,
      onTap: _getChangeBottomNav,
      //elevation: 50,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      //backgroundColor: ,
      selectedItemColor: Colors.orange[900],
      unselectedItemColor: Color.fromARGB(255, 1, 21, 88),
      type: BottomNavigationBarType.fixed,
      iconSize: 20,
      selectedLabelStyle: TextStyle(
          fontFamily: "NotoSans", fontSize: 12, fontWeight: FontWeight.w400),
      unselectedLabelStyle: TextStyle(
          fontFamily: "NotoSans", fontSize: 10, fontWeight: FontWeight.w400),
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
    );
  }

  void _getChangeBottomNav(int index) {
    context.read<BottomnavcubitCubit>().updateIndex(index);
  }
}

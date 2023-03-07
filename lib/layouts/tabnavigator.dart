// import 'package:flutter/material.dart';
// import 'package:gokul_f/screens/chat_screen.dart';
// import 'package:gokul_f/screens/dashboard_screen.dart';


// class TabNavigatorRoutes {
//   static const String root = '/';
//   static const String detail = '/detail';
// }

// class TabNavigator extends StatelessWidget {
//   TabNavigator({this.navigatorKey, this.tabItem});
//   final GlobalKey<NavigatorState> navigatorKey;
//   final String tabItem;

//   @override
//   Widget build(BuildContext context) {

//     Widget child ;
//     if(tabItem == "Page1")
//       child = DashBoardScreen(),;
//     else if(tabItem == "Page2")
//       child = ChatScreen();
//     else if(tabItem == "Page3")
//       child = CameraScreen();
    
//     return Navigator(
//       key: navigatorKey,
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(
//           builder: (context) => child
//         );
//       },
//     );
//   }
// }
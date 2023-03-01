import 'package:flutter/material.dart';
import 'package:gokul_f/layouts/bottom_navigation_Screen.dart';
import 'package:gokul_f/screens/job.dart';
import 'package:gokul_f/model/login_response_model.dart';
import 'package:gokul_f/screens/login/environment_screen.dart';
import 'package:gokul_f/screens/dashboard_screen.dart';
import 'package:gokul_f/screens/login/view/reset_screen.dart';
import '../screens/login/view/forgot_screen.dart';
import '../screens/login/view/login_view.dart';

class ScreenRoute {
  static Route<dynamic> routeGenerator(RouteSettings settings) {
    var args = settings.arguments;
    // var url = settings.arguments;
    // var urls = url.toString();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/forgotScreen':
        return MaterialPageRoute(builder: (_) => ForgotScreen());
      case '/environmentScreen':
        print("args om screen route: ${args.toString()}");
        for (var d in args as List<DomainModel>) {
          print("${d.toJson()}");
        }
        return MaterialPageRoute(
            builder: (_) => EnvironmentScreen(domains: args));
      case '/resetScreen':
        return MaterialPageRoute(builder: (_) => ResetScreen());
      case '/battomNavigation':
        // print("url om screen route: ${url.toString()}");
        return MaterialPageRoute(builder: (_) => BottomNavigation());
      case '/jobScreen':
        return MaterialPageRoute(builder: (_) => const JobScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginView());
    }
  }
}

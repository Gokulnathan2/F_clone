import 'package:flutter/material.dart';
import 'package:gokul_f/model/login_response_model.dart';
import 'package:gokul_f/screens/login/environment_screen.dart';
import 'package:gokul_f/screens/login/login_page.dart';
import 'package:gokul_f/screens/login/view/reset_screen.dart';

import '../screens/forgot_screen.dart';
import '../screens/login/view/login_view.dart';

class ScreenRoute {
  static Route<dynamic> routeGenerator(RouteSettings settings) {
    var args = settings.arguments;
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
      default:
        return MaterialPageRoute(builder: (_) => LoginView());
    }
  }
}

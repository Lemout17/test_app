import 'package:flutter/material.dart';
import 'package:test_app/presentation/screens/home_screen/home_screen.dart';
import 'package:test_app/presentation/screens/login_screen/login_screen.dart';

class Navigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case HomeScreen.route:
        if (args is HomeScreenArguments) {
          return MaterialPageRoute(
            builder: (_) => HomeScreen(
              username: args.username,
            ),
            settings: settings,
          );
        }
        return _errorRoute();
      case LoginScreen.route:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Center(
        child: Text('Error'),
      );
    });
  }
}

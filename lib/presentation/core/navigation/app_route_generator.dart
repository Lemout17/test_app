import 'package:flutter/material.dart';
import 'package:test_app/presentation/core/navigation/routes_constants.dart';
import 'package:test_app/presentation/screens/main_screen/main_screen.dart';
import 'package:test_app/presentation/screens/login_screen/login_screen.dart';

class Navigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RoutesConstants.main:
        if (args is MainScreenArguments) {
          return MaterialPageRoute(
            builder: (_) => MainScreen(
              username: args.username,
            ),
            settings: settings,
          );
        }
        return _errorRoute();
      case RoutesConstants.login:
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

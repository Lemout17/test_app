import 'package:flutter/material.dart';
import 'package:test_app/presentation/core/navigation/destination_model.dart';
import 'package:test_app/presentation/core/resources/app_icons.dart';
import 'package:test_app/presentation/screens/home_screen/home_screen.dart';

class DestinationsRoute {
  static final List<Destination> destinationsList = [
    Destination(
      title: 'Головна',
      icon: AppIcons.home,
      initialRoute: HomeScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      routeObserver: RouteObserver<ModalRoute>(),
      onGenerateRoute: (settings) {
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

          default:
            return null;
        }
      },
    ),
    Destination(
      title: 'Заявки',
      icon: AppIcons.clipboard_list,
      initialRoute: HomeScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      routeObserver: RouteObserver<ModalRoute>(),
      onGenerateRoute: (settings) {
        return null;
      },
    ),
    Destination(
      title: 'Особисті данні',
      icon: AppIcons.user,
      initialRoute: HomeScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      routeObserver: RouteObserver<ModalRoute>(),
      onGenerateRoute: (settings) {
        return null;
      },
    ),
  ];

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Center(
        child: Text('Error'),
      );
    });
  }
}

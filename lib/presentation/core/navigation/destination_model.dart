import 'package:flutter/material.dart';

class Destination {
  Destination({
    required this.title,
    required this.icon,
    required this.initialRoute,
    required this.navigatorState,
    this.scrollController,
    required this.onGenerateRoute,
    required this.routeObserver,
  });

  final String title;

  final IconData icon;

  final String initialRoute;

  final RouteFactory onGenerateRoute;

  final GlobalKey<NavigatorState> navigatorState;

  final ScrollController? scrollController;

  final RouteObserver<ModalRoute> routeObserver;
}

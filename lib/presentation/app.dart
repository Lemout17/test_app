import 'package:flutter/material.dart';
import 'package:test_app/presentation/core/navigation/app_route_generator.dart';
import 'package:test_app/presentation/core/navigation/routes_constants.dart';
import 'package:test_app/presentation/core/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      onGenerateRoute: Navigation.generateRoute,
      initialRoute: RoutesConstants.login,
    );
  }
}

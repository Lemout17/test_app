import 'package:flutter/material.dart';
import 'package:test_app/presentation/core/navigation/app_route_generator.dart';
import 'package:test_app/presentation/core/themes/theme.dart';
import 'package:test_app/presentation/screens/login_screen/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Short path test app',
      debugShowCheckedModeBanner: false,
      theme: themes[lightThemeName],
      onGenerateRoute: Navigation.generateRoute,
      initialRoute: LoginScreen.route,
    );
  }
}

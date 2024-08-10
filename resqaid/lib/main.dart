import 'package:flutter/material.dart';
import 'package:resqaid/navbar.dart';
import 'package:resqaid/routes.dart';
import 'package:resqaid/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.light,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const Navbar(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:resqaid/Notification/notificationHelper.dart';
import 'package:resqaid/authentication/authentication.dart';
import 'package:resqaid/chatbot/constants.dart';
import 'package:resqaid/provider/user_provider.dart';
import 'package:resqaid/routes.dart';
import 'package:resqaid/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: GEMINI_API_KEY);
  await NotificationService.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
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
      home: const Authentication(),
    );
  }
}

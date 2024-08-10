import 'package:flutter/material.dart';
import 'package:resqaid/authentication/authentication.dart';
import 'package:resqaid/authentication/signup.dart';
import 'package:resqaid/chatbot/chatbot.dart';
import 'package:resqaid/community/posts_screen.dart';
import 'package:resqaid/education/player.dart';
import 'package:resqaid/navbar.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case PostsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PostsScreen(),
      );
    case Chatbot.routeName:
      // final chatbot = routeSettings.arguments as Gemini;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Chatbot(),
      );
    case Player.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Player(),
      );
    case Navbar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Navbar(),
      );
    case Signup.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Signup(),
      );
    case Authentication.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Authentication(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}

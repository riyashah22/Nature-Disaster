import 'package:flutter/material.dart';
import 'package:resqaid/community/posts_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case PostsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PostsScreen(),
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

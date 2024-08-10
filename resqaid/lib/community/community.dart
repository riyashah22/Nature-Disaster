import 'package:flutter/material.dart';
import 'package:resqaid/community/posts_screen.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, PostsScreen.routeName);
            },
            child: Text("Post screen")),
      ),
    );
  }
}

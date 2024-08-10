import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:resqaid/chatbot/chatbot.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Welcome to ResQAid'),
            Gap(20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            Chatbot.routeName,
          );
        },
      ),
    );
  }
}

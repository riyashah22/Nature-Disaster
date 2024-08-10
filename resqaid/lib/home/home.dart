import 'package:flutter/material.dart';
import 'package:resqaid/chatbot/chatbot.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: Chatbot(),
    );
  }
}
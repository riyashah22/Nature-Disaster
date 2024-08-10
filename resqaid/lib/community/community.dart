import 'package:flutter/material.dart';
import 'package:resqaid/chatbot/chatbot.dart';
import 'package:resqaid/theme/theme_ext.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: appColors.error,
        onPressed: () {},
        tooltip: "SOS - Emergency",
        label: const Text("SOS"),
        extendedTextStyle: Theme.of(context).textTheme.titleMedium,
        icon: const Icon(Icons.emergency_share_rounded),
      ),
      appBar: AppBar(
        title: const Text("Support"),
      ),
      body: const Center(
        child: Text("Support Screen"),
      ),
    );
  }
}

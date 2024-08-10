import 'package:flutter/material.dart';
import 'package:resqaid/theme/theme_ext.dart';

class Chatbot extends StatelessWidget {
  const Chatbot({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return FloatingActionButton(onPressed: (){},backgroundColor: appColors.accent,);
  }
}
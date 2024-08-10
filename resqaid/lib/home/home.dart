import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:resqaid/chatbot/chatbot.dart';
import 'package:resqaid/theme/theme_ext.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    String _location = "fxghj";

    final appColors = context.appColors;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: appColors.richBlack,
                    ),
              ),
              Text(
                "ResQAid",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 40,
                    ),
              ),
              const Gap(10),
              Container(
                width: screenWidth * 0.95,
                height: screenHeight * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    _location,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: appColors.white,
                          overflow: TextOverflow.fade,
                        ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: appColors.navyBlue,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              const Gap(10),
              Text(
                "Air Quality",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: appColors.richBlack,
                      overflow: TextOverflow.fade,
                    ),
              ),
            ],
          ),
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

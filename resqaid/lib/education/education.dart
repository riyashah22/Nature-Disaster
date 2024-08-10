import 'package:flutter/material.dart';
import 'package:resqaid/education/player.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Education"),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                Player.routeName,
                arguments: "BLEPakj1YTY", // Pass the specific
              );
            },
            child: Text("earthquake"),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                Player.routeName,
                arguments: "43M5mZuzHF8", // Pass the specific
              );
            },
            child: Text("Flood"),
          ),
          // Add more images and onTap handlers for other videos here
        ],
      ),
    );
  }
}

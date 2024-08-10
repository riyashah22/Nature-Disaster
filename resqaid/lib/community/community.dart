import 'package:flutter/material.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.emergency,
        ),
      ),
      appBar: AppBar(
        // backgroundColor: Colors.red,
        title: Text("Support"),
      ),
      body: Center(
        child: Text("Support Screen"),
      ),
    );
  }
}

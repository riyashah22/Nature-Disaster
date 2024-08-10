import 'package:flutter/material.dart';
import 'package:resqaid/theme/theme_ext.dart';
import 'package:url_launcher/url_launcher.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: appColors.error,
        onPressed: () {
          _makePhoneCall("9099897859");
        },
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resqaid/Notification/notificationHelper.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Player extends StatefulWidget {
  static const String routeName = "/player-screen";

  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Retrieve both videoId and title from the arguments
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String videoId = args['videoId']!;
    final String title = args['title']!;

    // Load the video by its ID
    _controller.loadVideoById(videoId: videoId);

    // Set the AppBar title to the passed title
    setState(() {
      _title = title;
    });
  }

  late String _title;

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title), // Display the title dynamically
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(
                controller: _controller,
                aspectRatio: 16 / 9,
              ),
              const SizedBox(height: 16.0),
              Text(
                "How you can protect yourself?",
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              if (_title == "Earthquake") ...[
                _buildBulletPoint(
                    "Drop to your hands and knees to protect yourself from being knocked down."),
                _buildBulletPoint(
                    "Cover your head and neck under a sturdy table or desk."),
                _buildBulletPoint(
                    "Hold on to your shelter until the shaking stops."),
                _buildBulletPoint(
                    "If no shelter is nearby, crawl to an interior wall away from windows."),
                _buildBulletPoint(
                    "Stay indoors until the shaking stops and it's safe to go outside."),
                _buildBulletPoint(
                    "If you are in bed, stay there and protect your head with a pillow."),
                _buildBulletPoint(
                    "If you are outside, move to an open area away from buildings, trees, and power lines."),
                _buildBulletPoint(
                    "If you are in a car, stop in a clear area and stay inside the vehicle."),
              ] else if (_title == "Flood") ...[
                _buildBulletPoint(
                    "Move to higher ground immediately to avoid floodwaters."),
                _buildBulletPoint(
                    "Avoid walking or driving through floodwaters; they can be deeper than they appear."),
                _buildBulletPoint(
                    "Stay informed by listening to weather updates and warnings."),
                _buildBulletPoint(
                    "Turn off utilities like gas, electricity, and water if instructed."),
                _buildBulletPoint(
                    "Do not touch electrical equipment if you are wet or standing in water."),
                _buildBulletPoint(
                    "Move essential items to an upper floor if time permits."),
                _buildBulletPoint(
                    "If trapped in a building, go to its highest level. Do not climb into a closed attic; you may become trapped by rising floodwater."),
                _buildBulletPoint(
                    "Be cautious of fast-moving water, as it can sweep away people and vehicles."),
              ] else if (_title == "Hurricanes") ...[
                _buildBulletPoint(
                    "Listen to weather updates and evacuate if advised."),
                _buildBulletPoint(
                    "Secure your home by boarding up windows and doors."),
                _buildBulletPoint("Turn off utilities and unplug appliances."),
                _buildBulletPoint(
                    "Move to a small, windowless interior room on the lowest level."),
                _buildBulletPoint(
                    "Avoid using the phone except for emergencies."),
                _buildBulletPoint(
                    "Stay indoors until the hurricane has passed."),
                _buildBulletPoint(
                    "If you are outside, find shelter immediately."),
                _buildBulletPoint("Avoid floodwaters and downed power lines."),
              ] else if (_title == "Wildfire") ...[
                _buildBulletPoint(
                    "Prepare an emergency kit and plan an evacuation route."),
                _buildBulletPoint(
                    "Keep the car fueled and ready to leave at a moment's notice."),
                _buildBulletPoint(
                    "Wear protective clothing, including a long-sleeved shirt, long pants, and a mask."),
                _buildBulletPoint("If advised to evacuate, do so immediately."),
                _buildBulletPoint(
                    "Close all windows and doors, and remove flammable materials from the exterior."),
                _buildBulletPoint(
                    "Stay indoors if trapped, and keep all doors and windows closed."),
                _buildBulletPoint(
                    "Use a wet towel to block smoke from entering any gaps."),
                _buildBulletPoint(
                    "If driving, turn on headlights, drive slowly, and be cautious of low visibility."),
              ] else ...[
                _buildBulletPoint(
                    "Stay informed by monitoring weather and emergency alerts."),
                _buildBulletPoint(
                    "Follow the instructions of local authorities."),
                _buildBulletPoint("Have an emergency kit ready with supplies."),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.arrow_forward),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resqaid/education/player.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final List<String> sentences = [
    "Learn & Prepare for Natural Emergencies",
    "Stay Informed, Stay Safe",
    "Your Safety is Our Priority",
    "Be Ready for Any Disaster",
    "Knowledge is the Key to Safety"
  ];
  int currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % sentences.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Education"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.keyboard_double_arrow_right_sharp,
                    size: 50,
                  ),
                  Flexible(
                    child: Text(
                      sentences[currentIndex],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_double_arrow_left_sharp,
                    size: 50,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            // Earthquake
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Player.routeName,
                  arguments: {
                    'videoId': "BLEPakj1YTY",
                    'title': "Earthquake",
                  },
                );
              },
              child: _buildCategoryCard(
                context,
                "Earthquake",
                'https://www.india.com/wp-content/uploads/2023/10/Earthquake-of-5.3-Magnitude-in-Nepal-Unsplash.jpg',
              ),
            ),
            // Flood
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Player.routeName,
                  arguments: {
                    'videoId': "43M5mZuzHF8",
                    'title': "Flood",
                  },
                );
              },
              child: _buildCategoryCard(
                context,
                "Flood",
                'https://i.natgeofe.com/k/d25caf36-60a1-44c6-b078-348d78bc7772/Flash-Flood_Floods_KIDS_1022_16x9.jpg',
              ),
            ),
            // Hurricanes
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Player.routeName,
                  arguments: {
                    'videoId': "xHRbnuB9F1I",
                    'title': "Hurricanes",
                  },
                );
              },
              child: _buildCategoryCard(
                context,
                "Hurricanes",
                'https://t3.ftcdn.net/jpg/01/71/08/58/360_F_171085827_ljCnb5FXvbyYEDPPvJoZ0Bap3t3eIsPu.jpg',
              ),
            ),
            // Wildfire
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Player.routeName,
                  arguments: {
                    'videoId': "_bNLtjHG9dM",
                    'title': "Wildfire",
                  },
                );
              },
              child: _buildCategoryCard(
                context,
                "Wildfire",
                'https://w0.peakpx.com/wallpaper/145/878/HD-wallpaper-forest-fire-for-your-mobile-tablet-explore-forest-fire-wildland-fire-fire-fighting-wildfire.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, String title, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.black.withOpacity(0.4), // Light color overlay
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

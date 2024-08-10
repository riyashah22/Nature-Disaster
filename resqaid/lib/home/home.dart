import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:resqaid/chatbot/chatbot.dart';
import 'package:resqaid/theme/theme_ext.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _location = "fxghj";
  // String _pinCode="";
  // String _latitude="";
  // String _longitude="";
  String _name = "Name";
  String _type = "type";
  String _origin = "Bangalore";
  String _eta = "2:00 hrs";

  @override
  void initState() {
    super.initState();
    _getLocation();
    _getClimateUpdates();
  }

  //get the location using geolocator api
  _getLocation() async {}
  //get the climate updates using api by the location data obtained from _getLocation()
  _getClimateUpdates() async {}

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _name,
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: appColors.richBlack,
                                  fontSize: 35,
                                ),
                      ),
                      Text(
                        _type,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: appColors.richBlack,
                                  fontSize: 20,
                                ),
                      ),
                      const Divider(
                        thickness: 2,
                        endIndent: 10,
                        indent: 10,
                      ),
                      Text(
                        _origin,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: appColors.richBlack,
                            fontWeight: FontWeight.w700
                            // fontSize: 35,
                            ),
                      ),
                      Text(
                        "ETA : ${_eta}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: appColors.richBlack,
                              fontSize: 15,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(10),
              Container(
                width: screenWidth * 0.95,
                height: screenHeight * 0.1,
                decoration: BoxDecoration(
                  color: appColors.navyBlue,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
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
              ),
              const Gap(10),
              Text(
                "Air Quality",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: appColors.richBlack,
                      fontSize: 28,
                      overflow: TextOverflow.fade,
                    ),
              ),
              const Gap(10),
              Container(
                width: screenWidth * 0.95,
                height: screenHeight * 0.1,
                decoration: BoxDecoration(
                  color: appColors.white,
                  border: Border.all(width: 4),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                ),
              ),
              const Gap(10),
              Text(
                "Weather Forecast",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: appColors.richBlack,
                      fontSize: 28,
                      overflow: TextOverflow.fade,
                    ),
              ),
              const Gap(10),
              Container(
                width: screenWidth * 0.95,
                height: screenHeight * 0.1,
                decoration: BoxDecoration(
                  color: appColors.navyBlue,
                  // border: Border.all(width: 4),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
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

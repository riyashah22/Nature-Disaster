import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:resqaid/chatbot/chatbot.dart';
import 'package:resqaid/home/airquality.dart';
import 'package:resqaid/theme/theme_ext.dart';
import 'package:svg_flutter/svg_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AirQuality aqiData = AirQuality(
    aqi: 0,
    lat: 0,
    lon: 0,
    forecast: [
      Forecast(
        day: "2024 - 08 - 09",
        avg: 0,
        min: 0,
        max: 0,
      ),
      Forecast(
        day: "2024 - 08 - 10",
        avg: 0,
        min: 0,
        max: 0,
      ),
      Forecast(
        day: "2024 - 08 - 11",
        avg: 0,
        min: 0,
        max: 0,
      ),
      Forecast(
        day: "2024 - 08 - 12",
        avg: 0,
        min: 0,
        max: 0,
      ),
      Forecast(
        day: "2024 - 08 - 13",
        avg: 0,
        min: 0,
        max: 0,
      ),
      Forecast(
        day: "2024 - 08 - 14",
        avg: 0,
        min: 0,
        max: 0,
      ),
      Forecast(
        day: "2024 - 08 - 15",
        avg: 0,
        min: 0,
        max: 0,
      ),
    ],
  );
  // late AirQuality aqiData;
  String _location = "";
  String _name = "Green Zone!";
  String _type = "No immediate climate concerns";
  // String _origin = " --";
  String _eta = "00:00 hrs";

  @override
  void initState() {
    // _getLocation();
    fetchAirQuality().then(
      (value) async {
        setState(() {
          aqiData = value;
          _location = "Lati : ${aqiData.lat} , Long :  ${aqiData.lon}";
          // log(aqiData.forecast[0].toString());
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final appColors = context.appColors;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.accent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "ResQAid",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 40,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: appColors.richBlack,
                        ),
                  ),
                  FilledButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                      visualDensity: VisualDensity.comfortable,
                      fixedSize: const MaterialStatePropertyAll(
                        Size(60, 60),
                      ),
                      backgroundColor: MaterialStatePropertyAll(
                        // Color(0xff000000),
                        appColors.error,
                      ),
                      shape: const MaterialStatePropertyAll(
                        CircleBorder(
                            // side: BorderSide(),
                            ),
                      ),
                    ),
                    child: SvgPicture.asset("assets/icons/outline/logout.svg"),
                  ),
                ],
              ),
              Text(
                "Aryan",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 40,
                    ),
              ),
              const Gap(10),
              Card(
                color: appColors.accent,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/outline/like.svg",
                            height: screenHeight * 0.1,
                            color: appColors.primary,
                          ),
                          const Gap(10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: appColors.richBlack,
                                      fontSize: 35,
                                    ),
                              ),
                              Text(
                                _type,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color:
                                          appColors.richBlack.withOpacity(0.6),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                      // const Gap(10),
                      const Gap(10),
                      Center(
                        child: Text(
                          "ETA : ${_eta}",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: appColors.richBlack,
                                    fontSize: 15,
                                  ),
                        ),
                      ),
                      Divider(
                        color: appColors.primary,
                        thickness: 1,
                        endIndent: 10,
                        indent: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/outline/location.svg"),
                          Text(
                            _location,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: appColors.richBlack,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // const Gap(10),
              // Text(
              //   "Air Quality",
              //   style: Theme.of(context).textTheme.displaySmall!.copyWith(
              //         color: appColors.richBlack,
              //         fontSize: 28,
              //         overflow: TextOverflow.fade,
              //       ),
              // ),
              const Gap(10),
              Container(
                width: screenWidth * 0.95,
                height: screenHeight * 0.06,
                decoration: BoxDecoration(
                  color: aqiData.aqi <= 50
                      ? appColors.primary
                      : aqiData.aqi >= 50 && aqiData.aqi <= 100
                          ? appColors.mateYellow
                          : appColors.error,
                  border: Border.all(width: 4),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Air Quality : ${aqiData.aqi.toString()}",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: appColors.richBlack,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Gap(10),
              Text(
                "Weekly Forecast",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: appColors.richBlack,
                      fontSize: 28,
                      overflow: TextOverflow.fade,
                    ),
              ),
              const Gap(10),
              Container(
                height: screenHeight * 0.2,
                padding: EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.4,
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        color: appColors.accent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Gap(20),
                          Text("${aqiData.forecast[index].day}"),
                          Gap(10),
                          Divider(),
                          Text("Max: ${aqiData.forecast[index].max}"),
                          Text("Min: ${aqiData.forecast[index].min}"),
                          Text("Avg: ${aqiData.forecast[index].avg}"),
                        ],
                      ),
                    );
                  },
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              // Container(
              //   width: screenWidth * 0.95,
              //   height: screenHeight * 0.1,
              //   decoration: BoxDecoration(
              //     color: appColors.navyBlue,
              //     // border: Border.all(width: 4),
              //     borderRadius: const BorderRadius.all(
              //       Radius.circular(30),
              //     ),
              //   ),
              //   child: const Padding(
              //     padding: EdgeInsets.all(10),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset("assets/icons/outline/message.svg"),
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

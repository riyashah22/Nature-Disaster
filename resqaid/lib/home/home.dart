import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:resqaid/Notification/notificationHelper.dart';
import 'package:resqaid/chatbot/chatbot.dart';
import 'package:resqaid/home/airquality.dart';
import 'package:resqaid/provider/user_provider.dart';
import 'package:resqaid/theme/theme_ext.dart';
import 'package:intl/intl.dart';
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
        day: "2024-08-09",
        avg: 0,
        min: 0,
        max: 0,
      ),
      Forecast(
        day: "2024-08-10",
        avg: 0,
        min: 0,
        max: 0,
      ),
      Forecast(
        day: "2024-08-11",
        avg: 0,
        min: 0,
        max: 0,
      ),
      Forecast(
        day: "2024-08-12",
        avg: 0,
        min: 0,
        max: 0,
      ),
      Forecast(
        day: "2024-08-13",
        avg: 0,
        min: 0,
        max: 0,
      ),
      Forecast(
        day: "2024-08-14",
        avg: 0,
        min: 0,
        max: 0,
      ),
      Forecast(
        day: "2024-08-15",
        avg: 0,
        min: 0,
        max: 0,
      ),
    ],
  );
  // late AirQuality aqiData;
  String time = "";
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
    NotificationService.showInstantNotification(
        "Location", "Current location detected successfully");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final user = Provider.of<UserProvider>(context).user;
    final appColors = context.appColors;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: appColors.accent,
        // elevation: 0,
        centerTitle: true,
        title: Text(
          "ResQAid",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                // fontSize: 40,
                color: appColors.navyBlue,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "Hi, ",
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: appColors.richBlack,
                                ),
                        children: [
                          TextSpan(
                            text: user.username,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: appColors.primary,
                                ),
                          )
                        ]),
                  ),
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                        // backgroundColor: WidgetStatePropertyAll(
                        //   appColors.navyBlue,
                        // ),
                        ),
                    icon: Icon(
                      Icons.logout,
                      color: appColors.richBlack,
                    ),
                    onPressed: () {},
                    label: Text(
                      "Log out",
                      style: TextStyle(color: appColors.richBlack),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Card(
                color: appColors.white,
                elevation: 7,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/eco-friendly.gif",
                            height: screenHeight * 0.1,
                            // color: appColors.accent,
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
                      const Gap(10),
                      const Gap(10),
                      Center(
                        child: Text(
                          "Location fetched: ${DateFormat('dd-MM-yyyy hh:mm:ss').format(DateTime.now())}",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: appColors.navyBlue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
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
                  border: Border.all(width: 2),
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
              const Gap(16),
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
                height: screenHeight * 0.20,
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.3,
                      margin: const EdgeInsets.only(
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        // color: appColors.accent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                        border: Border.all(
                          width: 1,
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Gap(20),
                          Text(
                            DateFormat('yyyy-MM-dd').format(
                              DateTime.parse(aqiData.forecast[index].day),
                            ),
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/htemp.png",
                                height: 30,
                                width: 30,
                              ), // Icon for Max,
                              SizedBox(width: 16),
                              Text("${aqiData.forecast[index].max}"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/images/atemp.png",
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(width: 21),
                              Text("${aqiData.forecast[index].avg}"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/ltemp.png",
                                height: 30,
                                width: 30,
                              ), // Icon for Min
                              SizedBox(width: 16),
                              Text("${aqiData.forecast[index].min}"),
                            ],
                          )
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
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Designed & Developed By",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Vansh Shah, Riya Shah &  Aryan Mahji",
                      style: Theme.of(context).textTheme.labelLarge,
                    )
                  ],
                ),
              )
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

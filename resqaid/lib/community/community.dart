import 'package:flutter/material.dart';
import 'package:resqaid/Notification/notificationHelper.dart';
import 'package:resqaid/community/model/post.dart';
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
  List<Post> posts = [
    Post(
      title: "Wayanad Floods 2024",
      donationAmount: 35450.00,
      deadline: "15-08-2024",
      imageUrl:
          "https://imgs.search.brave.com/IEoar6GORQdDedIqV9Io0s4Qc825FZQBkbPq_9keR6c/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YWxqYXplZXJhLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAy/My8wOC9BUDIzMjI2/MzI5NTg1NTU3LTE2/OTIwMDUzMzAuanBn/P3c9NzcwJnJlc2l6/ZT03NzAsNDk1",
      description:
          "The Wayanad district in Kerala was severely affected by floods and landslides in August 2024 due to intense monsoon rains. The disaster led to widespread damage to homes, agriculture, and infrastructure. Donations are needed to provide immediate relief, including shelter, food, medical assistance, and support for rebuilding efforts.",
      postedBy: "State Disaster Management Authority",
      location: "Wayanad, Kerala",
      totalAmount: 67000,
    ),
    Post(
      title: "Himachal Pradesh Landslides 2023",
      donationAmount: 35970.00,
      deadline: "30-09-2023",
      imageUrl:
          "https://ichef.bbci.co.uk/news/1536/cpsprodpb/c09e/live/50608890-4e3d-11ef-93dc-c92fccfe6baf.jpg.webp",
      description:
          "The landslides triggered by heavy rains in Himachal Pradesh during August 2023 led to the destruction of homes and infrastructure, particularly in the Kullu and Shimla districts. Donations are required for rescue operations, rehabilitation, and rebuilding efforts.",
      postedBy: "State Disaster Management Authority",
      location: "Kullu and Shimla, Himachal Pradesh",
      totalAmount: 70000,
    ),
    Post(
      title: "Assam Floods Emergency Relief",
      donationAmount: 23750.00,
      deadline: "30-09-2022",
      imageUrl:
          "https://images.moneycontrol.com/static-mcnews/2024/07/20240702052720_Assam-Floods-1.png?impolicy=website&width=770&height=431",
      description:
          "The 2022 monsoon season brought severe flooding to Assam, displacing millions of people and causing significant damage to property. Donations are being collected to support rescue operations, provide medical aid, and assist in rehabilitation.",
      postedBy: "Assam State Government",
      location: "Assam, India",
      totalAmount: 75000,
    ),
    Post(
      title: "Maharashtra Floods 2021",
      donationAmount: 120000.00,
      deadline: "30-12-2021",
      imageUrl:
          "https://static.theprint.in/wp-content/uploads/2019/08/Maharashtra-flood.jpg",
      description:
          "The floods in Maharashtra in July 2021, caused by heavy rainfall, led to significant loss of life and property. The relief fund focuses on providing immediate assistance, including shelter, food, and medical care to affected communities.",
      postedBy: "Maharashtra State Government",
      location: "Maharashtra, India",
      totalAmount: 100000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
        title: const Text("Community AID Requests"),
      ),
      body: Container(
        width: width,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center(
            //   child: Text(
            //     "Community AID Requests",
            //     style: Theme.of(context).textTheme.titleLarge,
            //   ),
            // ),
            // const SizedBox(
            //   height: 8,
            // ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "\"We make a living by what we get, but we make a life by what we give\"",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: appColors.navyBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              // color: Colors.red,
              height: height * 0.6,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    // padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 4, // Spread radius
                          blurRadius: 3, // Blur radius
                          offset: const Offset(0, 2), // Shadow position (x, y)
                        ),
                      ],
                    ),
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.network(
                            posts[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            posts[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: appColors.richBlack,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            posts[index].description,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Raised: ₹${posts[index].donationAmount}",
                              style: TextStyle(
                                color: appColors.richBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      " of ₹${posts[index].totalAmount.toString()}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                appColors.navyBlue,
                              )),
                              icon: Icon(
                                posts[index].volunteerStatus
                                    ? Icons.check
                                    : Icons.person_add,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      backgroundColor: appColors.white,
                                      child: Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CircularProgressIndicator(
                                              color: appColors.navyBlue,
                                            ),
                                            SizedBox(width: 20),
                                            Text(
                                                "Adding you as a volunteer..."),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );

                                // Simulate a delay for the loading process
                                Future.delayed(const Duration(seconds: 2), () {
                                  setState(() {
                                    posts[index].volunteerStatus = true;
                                  });

                                  Navigator.of(context)
                                      .pop(); // Close the loading dialog

                                  // Show confirmation dialog
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: appColors.white,
                                        title: const Text("Success"),
                                        content: const Text(
                                            "You have been added as a volunteer."),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the confirmation dialog
                                            },
                                            child: const Text("OK"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                });
                              },
                              label: Text(
                                posts[index].volunteerStatus
                                    ? "Volunteered"
                                    : "Become Volunteer",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            ElevatedButton.icon(
                              icon: const Icon(Icons.currency_rupee),
                              onPressed: () {
                                // Show the loading dialog with the QR code
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              "Scan the QR Code to Donate",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 20),
                                            Image.network(
                                              'https://res.cloudinary.com/dq1q5mtdo/image/upload/v1723310293/codefury/tyv2xikrlxd6bkoqj92h.png',
                                              width: 150,
                                              height: 150,
                                            ),
                                            const SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close the QR code dialog

                                                setState(() {
                                                  posts[index].donationStatus =
                                                      true;
                                                });

                                                // Show the payment completed dialog
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          appColors.white,
                                                      title: const Text(
                                                        "Payment Completed",
                                                      ),
                                                      content: const Text(
                                                        "Thank you for your donation!",
                                                      ),
                                                      actions: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child:
                                                              const Text("OK"),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );

                                                // Send a notification after donation is completed
                                                NotificationService
                                                    .showInstantNotification(
                                                  "Donation Successful",
                                                  "Thank you for your generous donation of ₹${posts[index].donationAmount}!",
                                                );
                                              },
                                              child: const Text("OK"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              label: Text(
                                posts[index].donationStatus
                                    ? "Donated"
                                    : "Donate",
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                            child: Text(
                          "Posted By",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: appColors.richBlack,
                                    fontSize: 12,
                                  ),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              posts[index].postedBy,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: appColors.richBlack,
                                    fontSize: 14,
                                  ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(
                              Icons.verified_rounded,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        )
                      ],
                    ),
                  );
                },
                itemCount: posts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

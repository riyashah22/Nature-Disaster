import 'package:flutter/material.dart';
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
        title: const Text("Support"),
      ),
      body: Container(
        width: width,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Community AID Requests",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CircularProgressIndicator(),
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
                                Future.delayed(Duration(seconds: 2), () {
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
                                        title: Text("Success"),
                                        content: Text(
                                            "You have been added as a volunteer."),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the confirmation dialog
                                            },
                                            child: Text("OK"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                });
                              },
                              label: const Text(
                                "Become Volunteer",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            ElevatedButton.icon(
                              icon: const Icon(Icons.monetization_on),
                              onPressed: () {
                                // // Show the loading dialog with the QR code
                                // showDialog(
                                //   context: context,
                                //   barrierDismissible: false,
                                //   builder: (BuildContext context) {
                                //     return Dialog(
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(20.0),
                                //         child: Column(
                                //           mainAxisSize: MainAxisSize.min,
                                //           children: [
                                //             Text(
                                //               "Scan the QR Code to Donate",
                                //               style: TextStyle(
                                //                   fontSize: 16,
                                //                   fontWeight: FontWeight.bold),
                                //             ),
                                //             SizedBox(height: 20),
                                //             Image.network(
                                //               'https://example.com/your-qr-code.png', // Replace with your QR code image URL
                                //               width: 150,
                                //               height: 150,
                                //             ),
                                //             SizedBox(height: 20),
                                //             ElevatedButton(
                                //               onPressed: () {
                                //                 Navigator.of(context)
                                //                     .pop(); // Close the QR code dialog

                                //                 // Show the payment completed dialog
                                //                 showDialog(
                                //                   context: context,
                                //                   builder:
                                //                       (BuildContext context) {
                                //                     return AlertDialog(
                                //                       title: Text(
                                //                           "Payment Completed"),
                                //                       content: Text(
                                //                           "Thank you for your donation!"),
                                //                       actions: [
                                //                         TextButton(
                                //                           onPressed: () {
                                //                             Navigator.of(
                                //                                     context)
                                //                                 .pop(); // Close the payment completed dialog
                                //                           },
                                //                           child: Text("OK"),
                                //                         ),
                                //                       ],
                                //                     );
                                //                   },
                                //                 );
                                //               },
                                //               child: Text("OK"),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     );
                                //   },
                                // );
                              },
                              label: const Text(
                                "Donate",
                                style: TextStyle(
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

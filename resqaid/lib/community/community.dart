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
      donationAmount: 8500000.00,
      deadline: "30-09-2023",
      imageUrl:
          "https://ichef.bbci.co.uk/news/1536/cpsprodpb/c09e/live/50608890-4e3d-11ef-93dc-c92fccfe6baf.jpg.webp",
      description:
          "The landslides triggered by heavy rains in Himachal Pradesh during August 2023 led to the destruction of homes and infrastructure, particularly in the Kullu and Shimla districts. Donations are required for rescue operations, rehabilitation, and rebuilding efforts.",
      postedBy: "State Disaster Management Authority",
      location: "Kullu and Shimla, Himachal Pradesh",
    ),
    Post(
      title: "Wayanad Floods 2024",
      donationAmount: 3545000.00,
      deadline: "15-08-2024",
      imageUrl:
          "https://imgs.search.brave.com/IEoar6GORQdDedIqV9Io0s4Qc825FZQBkbPq_9keR6c/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YWxqYXplZXJhLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAy/My8wOC9BUDIzMjI2/MzI5NTg1NTU3LTE2/OTIwMDUzMzAuanBn/P3c9NzcwJnJlc2l6/ZT03NzAsNDk1",
      description:
          "The Wayanad district in Kerala was severely affected by floods and landslides in August 2024 due to intense monsoon rains. The disaster led to widespread damage to homes, agriculture, and infrastructure. Donations are needed to provide immediate relief, including shelter, food, medical assistance, and support for rebuilding efforts.",
      postedBy: "State Disaster Management Authority",
      location: "Wayanad, Kerala",
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
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            posts[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       posts[index].postedBy,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .titleSmall!
                        //           .copyWith(
                        //             color: Colors.grey,
                        //             fontSize: 16,
                        //           ),
                        //     ),
                        //     SizedBox(
                        //       width: 8,
                        //     ),
                        //     const Icon(
                        //       Icons.verified,
                        //       color: Colors.blue,
                        //       size: 20,
                        //     ),
                        //   ],
                        // ),
                        Text(
                          posts[index].title,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: appColors.richBlack,
                                  ),
                        ),
                        Text(
                          posts[index].description,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          "Donated: ₹${posts[index].donationAmount}",
                          style: TextStyle(
                            color: appColors.richBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlinedButton.icon(
                              style: ButtonStyle(
                                  foregroundColor: WidgetStatePropertyAll(
                                appColors.navyBlue,
                              )),
                              icon: Icon(Icons.person_add),
                              onPressed: () {},
                              label: Text(
                                "Volunteer",
                              ),
                            ),
                            ElevatedButton.icon(
                              icon: Icon(Icons.monetization_on),
                              onPressed: () {},
                              label: Text(
                                "Donate",
                              ),
                            )
                          ],
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

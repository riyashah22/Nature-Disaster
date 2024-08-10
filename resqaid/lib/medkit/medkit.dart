import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resqaid/theme/theme_ext.dart';

class Medkit extends StatefulWidget {
  const Medkit({super.key});

  @override
  _MedkitState createState() => _MedkitState();
}

class _MedkitState extends State<Medkit> {
  String selectedCategory = 'Earthquake';
  bool isDropdownOpen = false;

  final Map<String, List<Map<String, dynamic>>> categoryDetails = {
    'Earthquake': [
      {
        'title': 'Minor Cuts and Scrapes',
        'images': [
          'https://i0.wp.com/www.cprfirstaidtraining.co.uk/wp-content/uploads/2021/12/Knee-Graze.png?resize=640%2C373&ssl=1', // Replace with actual image URLs
          'https://sa1s3optim.patientpop.com/assets/images/provider/photos/2572479.jpg'
        ],
        'steps': [
          '1. Wash the wound with soap and clean water to remove any dirt.',
          '2. Pat the area dry with a clean cloth or tissue.',
          '3. Apply an antiseptic ointment or honey to the wound.',
          '4. Cover with a sterile bandage or gauze.'
        ]
      },
      {
        'title': 'Bruises',
        'images': [
          'https://t4.ftcdn.net/jpg/02/30/89/01/360_F_230890176_W7kq1BrthDaD9BuQ8GKEfYCGH0lWUxIr.jpg', // Replace with actual image URLs
          'https://media.post.rvohealth.io/wp-content/uploads/2017/06/732x549_THUMBNAIL_How_to_Get_Rid_of_Bruises.jpg'
        ],
        'steps': [
          '1. Wrap an ice pack in a cloth or towel (never apply ice directly to the skin).',
          '2. Apply the ice pack to the bruised area for 10-15 minutes.',
          '3. Repeat every few hours as needed.',
          '4. Apply Arnica gel to reduce bruising (optional).'
        ]
      },
      {
        'title': 'Sprains',
        'images': [
          'https://i-cf65.ch-static.com/content/dam/cf-consumer-healthcare/health-professionals/en_US/pain-relief/sprains-and-strains-overview_970x416px.jpg?auto=format', // Replace with actual image URLs
          'https://faasny.com/wp-content/uploads/2022/08/foot-sprain-.png'
        ],
        'steps': [
          '1. Rest: Stop any activity and rest the injured area.',
          '2. Ice: Apply an ice pack wrapped in a cloth to the area for 15-20 minutes.',
          '3. Compression: Wrap the area with an elastic bandage to reduce swelling.',
          '4. Elevation: Keep the injured area elevated above heart level to reduce swelling.'
        ]
      },
      {
        'title': 'Nosebleeds',
        'images': [
          'https://www.drmasurkarsclinic.com/wp-content/uploads/2021/01/2018-04-20_11-34-08.png', // Replace with actual image URLs
          'https://media.istockphoto.com/id/1171256405/photo/nosebleed-a-young-woman-with-a-bloody-nose-healthcare-and-medical-concept.jpg?s=612x612&w=0&k=20&c=Wl4eDzP2nZ779lBMYFrOQLHr588GvgO9I90yUzaFbGo='
        ],
        'steps': [
          '1. Sit down and lean slightly forward (do not tilt your head back).',
          '2. Pinch the soft part of your nose just below the bridge.',
          '3. Hold for 5-10 minutes while breathing through your mouth.',
          '4. Apply a cold compress to the back of your neck to help stop the bleeding.'
        ]
      },
      {
        'title': 'Eye Irritation',
        'images': [
          'https://www.magrudereye.com/wp-content/uploads/2018/12/eye-irritation.jpeg', // Replace with actual image URLs
          'https://totalvisionsolanabeach.com/wp-content/uploads/2023/05/man-putting-in-eye-drops.png'
        ],
        'steps': [
          '1. Rinse your eye with clean, cool water or a saline solution.',
          '2. Blink several times to help flush out any debris.',
          '3. Place a cool, damp cloth over the closed eye to reduce irritation.',
          '4. Avoid rubbing your eye.'
        ]
      },
    ],
    'Floods': [
      {
        'title': 'Minor Cuts and Scrapes',
        'images': [
          'https://i0.wp.com/www.cprfirstaidtraining.co.uk/wp-content/uploads/2021/12/Knee-Graze.png?resize=640%2C373&ssl=1', // Replace with actual image URLs
          'https://specializedhealthandsafety.com/wp-content/uploads/2020/03/first-aid-scrapes.png'
        ],
        'steps': [
          '1. Wash the wound thoroughly with soap and clean water.',
          '2. Dry the area with a clean cloth or tissue.',
          '3. Apply an antiseptic ointment to the wound.',
          '4. Cover with a waterproof bandage.'
        ]
      },
      {
        'title': 'Blisters',
        'images': [
          'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2020_27/1586040/eczema-te-inline-200630.jpg', // Replace with actual image URLs
          'https://bestmadenaturalproducts.com/cdn/shop/products/blisters-and-sores-natural-remedy-bm121-bm-products-liquid-bottle-packaging-399.jpg?v=1668329640'
        ],
        'steps': [
          '1. Keep the blister clean and dry.',
          '2. Avoid popping the blister. If it bursts, clean the area with soap and water.',
          '3. Apply an antiseptic ointment.',
          '4. Cover with a clean bandage to protect the area.'
        ]
      },
      {
        'title': 'Athlete\'s Foot',
        'images': [
          'https://www.mayoclinic.org/-/media/kcms/gbs/patient-consumer/images/2013/08/26/10/33/ds00317_im03573_sn7_athletes_foot_2thu_jpg.jpg', // Replace with actual image URLs
          'https://www.wikihow.com/images/thumb/e/e6/Cure-Athlete%27s-Foot-Naturally-Step-1-Version-3.jpg/v4-460px-Cure-Athlete%27s-Foot-Naturally-Step-1-Version-3.jpg.webp'
        ],
        'steps': [
          '1. Clean and dry your feet thoroughly, especially between the toes.',
          '2. Apply tea tree oil or apple cider vinegar to the affected area.',
          '3. Wear dry, breathable socks and shoes to prevent moisture buildup.'
        ]
      },
      {
        'title': 'Skin Irritation',
        'images': [
          'https://images.theconversation.com/files/209558/original/file-20180308-30983-e4u830.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=754&fit=clip', // Replace with actual image URLs
          'https://cdn2.stylecraze.com/wp-content/uploads/2021/07/Does-Aloe-Vera-Stop-Itching.jpg.webp'
        ],
        'steps': [
          '1. Rinse the affected skin with clean water to remove contaminants.',
          '2. Pat dry with a clean towel.',
          '3. Apply aloe vera gel or an oatmeal paste to soothe the irritation.'
        ]
      },
    ],
    'Wildfire': [
      {
        'title': 'Minor Burns',
        'images': [
          'https://www.southtees.nhs.uk/wp-content/uploads/2021/12/minor-burn-800x400.jpg', // Replace with actual image URLs
          'https://bloximages.chicago2.vip.townnews.com/thecourierexpress.com/content/tncms/assets/v3/editorial/0/92/09276668-63d0-11ee-8d76-c7f78c972e9d/651f3b5ac6859.image.jpg?resize=1200%2C747'
        ],
        'steps': [
          '1.Run cool (not cold) water over the burn for 10-15 minutes.',
          '2.Pat the area dry gently with a clean cloth.',
          '3.Apply aloe vera gel or honey to the burn to soothe and heal.',
          '4.Cover with a loose, sterile bandage if needed.'
        ]
      },
      {
        'title': 'Insect Bites and Stings',
        'images': [
          'https://i0.wp.com/post.healthline.com/wp-content/uploads/2019/12/Mosquito-Bite-1296x728-Header-1296x728.jpg?w=1155&h=1528', // Replace with actual image URLs
          'https://www.farmersalmanac.com/wp-content/uploads/2006/01/bakingsoda4.jpg'
        ],
        'steps': [
          '1.Wash the area with soap and water to remove any dirt or irritants.',
          '2.Apply a baking soda paste (mix baking soda with water) or vinegar to reduce itching and swelling.',
          '3.Apply aloe vera gel to soothe the skin.',
          '4.If the sting is severe, seek medical attention.'
        ]
      },
      {
        'title': 'Smoke Inhalation',
        'images': [
          'https://emcare.org/images/firefighting-course-coughing-from-smoke-inhalation-min.jpg', // Replace with actual image URLs
          'https://images.healthshots.com/healthshots/en/uploads/2023/09/08105737/steam.jpg'
        ],
        'steps': [
          '1.Move the person to fresh air immediately.',
          '2.Encourage them to drink plenty of water to stay hydrated.',
          '3.Have the person breathe in steam from a bowl of hot water (cover their head with a towel).'
        ]
      },
      {
        'title': 'Eye Irritation',
        'images': [
          'https://www.magrudereye.com/wp-content/uploads/2018/12/eye-irritation.jpeg', // Replace with actual image URLs
          'https://totalvisionsolanabeach.com/wp-content/uploads/2023/05/man-putting-in-eye-drops.png'
        ],
        'steps': [
          '1. Rinse your eye with clean, cool water or a saline solution.',
          '2. Blink several times to help flush out any debris.',
          '3. Place a cool, damp cloth over the closed eye to reduce irritation.',
          '4. Avoid rubbing your eye.'
        ]
      },
      {
        'title': 'Heat Exhaustion',
        'images': [
          'https://assets-us-01.kc-usercontent.com/617312fb-2e06-4b4b-a69a-d0a0fea7798f/c60eb8c9-4e23-4e46-8499-19dad53a1fbe/heat%20exhaustion.jpg', // Replace with actual image URLs
          'https://static.toiimg.com/thumb/imgsize-23456,msid-110543836,width-600,resizemode-4/110543836.jpg'
        ],
        'steps': [
          '1.Move the person to a cooler, shaded area.',
          '2.Remove any excessive clothing.',
          '3.Encourage the person to drink water or an electrolyte drink slowly.',
          '4.Apply cool compresses to the skin, especially the forehead, neck, and armpits.'
        ]
      },
    ],
    'Hurricanes and Typhoons': [
      {
        'title': 'Sprains',
        'images': [
          'https://i-cf65.ch-static.com/content/dam/cf-consumer-healthcare/health-professionals/en_US/pain-relief/sprains-and-strains-overview_970x416px.jpg?auto=format', // Replace with actual image URLs
          'https://faasny.com/wp-content/uploads/2022/08/foot-sprain-.png'
        ],
        'steps': [
          '1. Rest: Stop any activity and rest the injured area.',
          '2. Ice: Apply an ice pack wrapped in a cloth to the area for 15-20 minutes.',
          '3. Compression: Wrap the area with an elastic bandage to reduce swelling.',
          '4. Elevation: Keep the injured area elevated above heart level to reduce swelling.'
        ]
      },
      {
        'title': 'Minor Cuts and Scrapes',
        'images': [
          'https://i0.wp.com/www.cprfirstaidtraining.co.uk/wp-content/uploads/2021/12/Knee-Graze.png?resize=640%2C373&ssl=1', // Replace with actual image URLs
          'https://sa1s3optim.patientpop.com/assets/images/provider/photos/2572479.jpg'
        ],
        'steps': [
          '1. Wash the wound with soap and clean water to remove any dirt.',
          '2. Pat the area dry with a clean cloth or tissue.',
          '3. Apply an antiseptic ointment or honey to the wound.',
          '4. Cover with a sterile bandage or gauze.'
        ]
      },
      {
        'title': 'Dehydration',
        'images': [
          'https://emi.parkview.com/media/Image/Dashboard_835_Reasons-why-we-get-dehydrated_7_23.jpg', // Replace with actual image URLs
          'https://media.self.com/photos/5972281835f46850de3024c6/16:9/w_1280,h_720,c_limit/SportsDrink-Truth-Electrolyte.jpg'
        ],
        'steps': [
          '1.Move the person to a cool, shaded area.',
          '2.Have them sip water or an electrolyte solution slowly.',
          '3.Rest in a cool area and avoid further physical activity until fully rehydrated.'
        ]
      },
      {
        'title': 'Sunburn',
        'images': [
          'https://media.allure.com/photos/59494fee7725e22fe0b0d5e3/16:9/w_2560%2Cc_limit/man-sunburn.jpg', // Replace with actual image URLs
          'https://static.toiimg.com/thumb/msid-68991946,width-1280,height-720,imgsize-811560,resizemode-6,overlay-toi_sw,pt-32,y_pad-40/photo.jpg'
        ],
        'steps': [
          '1.Move out of the sun and into a shaded or cool area.',
          '2.Apply cool compresses to the affected areas.',
          '3.Apply aloe vera gel or coconut oil to soothe and moisturize the skin.',
          '4.Drink plenty of water to stay hydrated.'
        ]
      },
      {
        'title': 'Torn Nails',
        'images': [
          'https://www.thesun.co.uk/wp-content/uploads/2020/10/NINTCHDBPICT000615412295.jpg?strip=all&w=954', // Replace with actual image URLs
          'https://www.shutterstock.com/image-photo/bandage-on-injured-finger-600nw-322434827.jpg'
        ],
        'steps': [
          '1. Carefully trim the torn nail to prevent further injury.',
          '2. Clean the area with soap and water.',
          '3. Apply an antiseptic ointment to the exposed area.',
          '4. Cover with a bandage to protect the nail bed.'
        ]
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Medical Information",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: appColors.navyBlue, width: 1.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<String>(
                  dropdownColor: Colors.white,
                  value: selectedCategory,
                  icon: AnimatedRotation(
                    turns: isDropdownOpen ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(Icons.arrow_drop_down),
                  ),
                  isExpanded: true,
                  underline: SizedBox(), // Hides the default underline
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                      isDropdownOpen =
                          !isDropdownOpen; // Toggle dropdown open state
                    });
                  },
                  onTap: () {
                    setState(() {
                      isDropdownOpen =
                          !isDropdownOpen; // Toggle dropdown open state
                    });
                  },
                  items: categoryDetails.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            fontSize: 18.0, color: appColors.navyBlue),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              textAlign: TextAlign.center,
              "\"Strength in adversity, unity in recovery.\"",
              style: GoogleFonts.raleway(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
                color: appColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: categoryDetails[selectedCategory]!.length,
                itemBuilder: (context, index) {
                  final item = categoryDetails[selectedCategory]![index];
                  return Card(
                    color: appColors.accent,
                    shadowColor: appColors.accent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                        side: BorderSide(width: 0.2, color: appColors.primary)),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Carousel for images
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 200,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.easeInOut,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              viewportFraction: 0.9,
                            ),
                            items: (item['images'] as List<String>)
                                .map((imageUrl) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              item['title'],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: appColors.richBlack,
                                letterSpacing: 1.2,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: (item['steps'] as List<String>)
                                .map<Widget>((step) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 2),
                                      child: Text(
                                        textAlign: TextAlign.justify,
                                        step,
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

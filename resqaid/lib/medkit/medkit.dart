import 'package:flutter/material.dart';

class Medkit extends StatefulWidget {
  const Medkit({super.key});

  @override
  _MedkitState createState() => _MedkitState();
}

class _MedkitState extends State<Medkit> {
  String selectedCategory = 'Earthquake';

  final Map<String, List<Map<String, dynamic>>> categoryDetails = {
    'Earthquake': [
      {
        'title': 'Minor Cuts and Scrapes',
        'steps': [
          '1. Wash the wound with soap and clean water to remove any dirt.',
          '2. Pat the area dry with a clean cloth or tissue.',
          '3. Apply an antiseptic ointment or honey to the wound.',
          '4. Cover with a sterile bandage or gauze.'
        ]
      },
      {
        'title': 'Bruises',
        'steps': [
          '1. Wrap an ice pack in a cloth or towel (never apply ice directly to the skin).',
          '2. Apply the ice pack to the bruised area for 10-15 minutes.',
          '3. Repeat every few hours as needed.',
          '4. Apply Arnica gel to reduce bruising (optional).'
        ]
      },
      {
        'title': 'Sprains',
        'steps': [
          '1. Rest: Stop any activity and rest the injured area.',
          '2. Ice: Apply an ice pack wrapped in a cloth to the area for 15-20 minutes.',
          '3. Compression: Wrap the area with an elastic bandage to reduce swelling.',
          '4. Elevation: Keep the injured area elevated above heart level to reduce swelling.'
        ]
      },
      {
        'title': 'Nosebleeds',
        'steps': [
          '1. Sit down and lean slightly forward (do not tilt your head back).',
          '2. Pinch the soft part of your nose just below the bridge.',
          '3. Hold for 5-10 minutes while breathing through your mouth.',
          '4. Apply a cold compress to the back of your neck to help stop the bleeding.'
        ]
      },
      {
        'title': 'Eye Irritation',
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
        'steps': [
          '1. Wash the wound thoroughly with soap and clean water.',
          '2. Dry the area with a clean cloth or tissue.',
          '3. Apply an antiseptic ointment to the wound.',
          '4. Cover with a waterproof bandage.'
        ]
      },
      {
        'title': 'Blisters',
        'steps': [
          '1. Keep the blister clean and dry.',
          '2. Avoid popping the blister. If it bursts, clean the area with soap and water.',
          '3. Apply an antiseptic ointment.',
          '4. Cover with a clean bandage to protect the area.'
        ]
      },
      {
        'title': 'Athlete\'s Foot',
        'steps': [
          '1. Clean and dry your feet thoroughly, especially between the toes.',
          '2. Apply tea tree oil or apple cider vinegar to the affected area.',
          '3. Wear dry, breathable socks and shoes to prevent moisture buildup.'
        ]
      },
      {
        'title': 'Hypothermia (Mild)',
        'steps': [
          '1. Remove any wet clothing and replace it with dry, warm clothing.',
          '2. Wrap the person in blankets or warm towels.',
          '3. Offer warm (not hot) liquids like broth or tea to drink.',
          '4. Avoid direct heat sources like hot water bottles or heaters.'
        ]
      },
      {
        'title': 'Skin Irritation',
        'steps': [
          '1. Rinse the affected skin with clean water to remove contaminants.',
          '2. Pat dry with a clean towel.',
          '3. Apply aloe vera gel or an oatmeal paste to soothe the irritation.'
        ]
      },
    ],
    'Wildfire': [
      {
        'title': 'Minor Burns (First-Degree Burns)',
        'steps': [
          '1.Run cool (not cold) water over the burn for 10-15 minutes.',
          '2.Pat the area dry gently with a clean cloth.',
          '3.Apply aloe vera gel or honey to the burn to soothe and heal.',
          '4.Cover with a loose, sterile bandage if needed.'
        ]
      },
      {
        'title': 'Insect Bites and Stings',
        'steps': [
          '1.Wash the area with soap and water to remove any dirt or irritants.',
          '2.Apply a baking soda paste (mix baking soda with water) or vinegar to reduce itching and swelling.',
          '3.Apply aloe vera gel to soothe the skin.',
          '4.If the sting is severe, seek medical attention.'
        ]
      },
      {
        'title': 'Smoke Inhalation (Mild)',
        'steps': [
          '1.Move the person to fresh air immediately.',
          '2.Encourage them to drink plenty of water to stay hydrated.',
          '3.Have the person breathe in steam from a bowl of hot water (cover their head with a towel) to soothe irritated airways.'
        ]
      },
      {
        'title': 'Eye Irritation',
        'steps': [
          '1.Rinse the eyes with clean water or a saline solution.',
          '2.Blink several times to help flush out any particles.',
          '3.Apply a cool, damp cloth to the closed eyes to reduce irritation.'
        ]
      },
      {
        'title': 'Heat Exhaustion',
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
        'steps': [
          '1.Rest: Stop any activity and keep the injured area at rest.',
          '2.Ice: Apply an ice pack wrapped in a cloth to the area for 15-20 minutes.',
          '3.Compression: Wrap the area with an elastic bandage to reduce swelling.',
          '4.Elevation: Keep the injured area elevated above heart level.'
        ]
      },
      {
        'title': 'Minor Cuts and Scrapes',
        'steps': [
          '1.Wash the wound with soap and clean water.',
          '2.Pat dry with a clean cloth.',
          '3.Apply an antiseptic ointment to prevent infection.',
          '4.Cover with a sterile bandage.'
        ]
      },
      {
        'title': 'Dehydration',
        'steps': [
          '1.Move the person to a cool, shaded area.',
          '2.Have them sip water or an electrolyte solution slowly.',
          '3.Rest in a cool area and avoid further physical activity until fully rehydrated.'
        ]
      },
      {
        'title': 'Sunburn',
        'steps': [
          '1.Move out of the sun and into a shaded or cool area.',
          '2.Apply cool compresses to the affected areas.',
          '3.Apply aloe vera gel or coconut oil to soothe and moisturize the skin.',
          '4.Drink plenty of water to stay hydrated.'
        ]
      },
      {
        'title': 'Torn Nails',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical Information"),
        actions: const [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.image), // Replace with your image
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedCategory,
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: categoryDetails.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: categoryDetails[selectedCategory]!.length,
                itemBuilder: (context, index) {
                  final item = categoryDetails[selectedCategory]![index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              item['title'],
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Divider(thickness: 2),
                          // Image placed at the top
                          Center(
                            child: Image.network(
                              'https://via.placeholder.com/200', // Replace with relevant image
                              height: 170,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Steps listed below the image
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

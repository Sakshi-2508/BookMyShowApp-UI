import 'package:flutter/material.dart';

import 'images.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({super.key});

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  // List of image paths for the banners
  final List<String> bannerImages = [
    'assets/prime.jpg',
    'assets/prime1.jpg',
    'assets/prime2.jpg',
    'assets/prime3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book My Show'),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for movies, events, shows...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
          ),
        ),
      ),
      body:
      ListView(
        children: [
          // Carousel
          SizedBox(
            height: 200,
            child: PageView.builder(
              itemCount: 4, // Number of items
              itemBuilder: (context, index) => Card(
                child: Image.asset(bannerImages[index], fit: BoxFit.cover),
              ),
            ),
          ),

          // Banner
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: Image.asset(
                  'assets/smart.jpg', // Replace with your ad image path
                  fit: BoxFit.fitWidth,
                  height: 60,
                  width: double.infinity,
                ),
              ),
            ),
          ),

          // Categories
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryIcon(Icons.movie, 'Movies'),
                _buildCategoryIcon(Icons.event, 'Events'),
                _buildCategoryIcon(Icons.theater_comedy, 'Plays'),
                _buildCategoryIcon(Icons.sports, 'Sports'),
              ],
            ),
          ),

          // Recommended for You Section
          _buildHorizontalList('Recommended for You', context),

          // Banner with padding
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: Image.asset(
                  'assets/cinema1.jpg', // Update with your ad image path
                  fit: BoxFit.cover,
                  height: 90,
                  width: double.infinity,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10), // Space between the list and the banner

          // Special Offer Banner
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.purpleAccent, // Background color for the banner
            width: double.infinity,
            child: const Text(
              'Special Offer: Get 20% off on Movie Tickets!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Ticket Banner
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: Image.asset(
                  'assets/ticket.jpg', // Update with your image path
                  fit: BoxFit.cover,
                  height: 180,
                  width: double.infinity,
                ),
              ),
            ),
          ),

          // Maroon 5 Live Widget
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Maroon5LiveWidget(),
          ),
        ],
      ),
    );
  }
}

Widget _buildCategoryIcon(IconData icon, String label) {
  return Column(
    children: [
      Icon(icon, size: 40),
      Text(label),
    ],
  );
}

// Recommended for You Horizontal List
Widget _buildHorizontalList(String title, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title,
            style:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      Container(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageList.length,
          itemBuilder: (context, index) => Container(
            width: 100,
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 100,
                    height: 150,
                    child: imageList[index],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Title $index',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}


class Maroon5LiveWidget extends StatelessWidget {
  const Maroon5LiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[200],
      // Light grey background
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      // Vertical padding for spacing
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Title for the section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "Maroon 5 - LIVE in Mumbai!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 250, // Set the height for the scrollable area
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                padding: const EdgeInsets.only(left: 12.0),
                // Padding between images

                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    // This will help with flexible height
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.asset(
                          imagePaths[index], // Each image path in the list
                          fit: BoxFit.cover,
                          height: 180,
                          // Adjusted height to prevent overflow
                          width: 280,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // Reduced padding
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const  Text(
                            //   imageTexts[index],
                            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            // ),
                            const SizedBox(height: 4),
                            Text(
                              imageTexts[index],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        //TODO amusement park//

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "Enjoy Old Movies in Theatre",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 8),
        SizedBox(
          height: 200, // Set the height for the scrollable area
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                padding: const EdgeInsets.only(left: 12.0),
                // Padding between images

                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    // This will help with flexible height
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                        child: Image.asset(
                          images[index], // Each image path in the list
                          fit: BoxFit.cover,
                          height: 150,
                          // Adjusted height to prevent overflow
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // New Banner Section
        const SizedBox(height: 1),
        Container(
          padding: const EdgeInsets.all(1.0), // Add padding around the image
          height: 150,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              // Apply the same radius to the image
              child: Image.asset(
                'assets/corn.jpg', // Your single image path
                fit: BoxFit.cover,
                height: 200,
                width: double
                    .infinity, // Make the image cover the full width of the container
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Header
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Best Events This Week",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/event1.jpg',
                  width: 100,
                  height: 100,
                ),
                Image.asset(
                  'assets/event2.jpg',
                  width: 100,
                  height: 100,
                ),
                Image.asset(
                  'assets/event3.jpg',
                  width: 100,
                  height: 100,
                ),
              ],
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Align text to the start
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  // Add padding around the title
                  child: Text(
                    'Upcoming Events',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Example for creating each image with text
                      for (var item in [
                        {'image': 'assets/game1.jpg', 'label': 'Sports'},
                        {'image': 'assets/game2.png', 'label': 'Dance'},
                        {'image': 'assets/game3.png', 'label': 'Community'},
                        {
                          'image': 'assets/game4.jpg',
                          'label': 'Plays and Performance'
                        },
                        {'image': 'assets/game5.jpg', 'label': 'Festival'},
                        {'image': 'assets/game6.jpg', 'label': 'Concert'},
                        {'image': 'assets/game7.jpg', 'label': 'Expo'},
                      ])
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          // Spacing
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                // Rounded corners
                                child: Image.asset(
                                  item['image']!,
                                  width: 190, // Fixed width
                                  height: 120, // Fixed height
                                  fit: BoxFit
                                      .cover, // Ensures consistent scaling
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Space between image and text
                              Text(
                                item['label']!,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            )


          ],
        )
      ]),
    );
  }
}

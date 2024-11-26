import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class EventPage extends StatefulWidget {
  final List<String> imagePaths = [
    'assets/show1.jpg',
    'assets/show2.jpg',
    'assets/show3.jpg',
    'assets/show4.jpg',
    'assets/show5.jpg',
    'assets/show6.jpg',
    'assets/show7.jpg',
    'assets/show8.jpg',
  ];

  final List<String> imageTexts = [
    'Music Shows',
    'Comedy Shows',
    'Play',
    'Sports',
    'Performance',
    'Amusement Parks',
    'Adventure',
    'All Explore',
  ];

  final List<String> todo = [
    'assets/todo1.jpg',
    'assets/todo2.jpg',
    'assets/todo3.jpg',
    'assets/todo4.jpg',
  ];

  final List<String> dot = [
    'assets/dot1.jpg',
    'assets/dot2.jpg',
    'assets/dot3.jpg',
    'assets/dot4.jpg',
    'assets/dot5.jpg',
    'assets/dot6.jpg',
    'assets/dot7.jpg',
    'assets/dot8.jpg',
  ];

  EventPage({super.key});

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    // Initialize the video player controller with a local video file
    _videoController = VideoPlayerController.asset('assets/video.mp4')
      ..initialize().then((_) {
        setState(() {}); // Refresh the UI after video is initialized
      })
      ..setLooping(true); // Loop the video
  }

  @override
  void dispose() {
    _videoController
        .dispose(); // Dispose of the controller when no longer needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Experience Live Events')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Horizontal Image Slider
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(widget.imagePaths.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                widget.imagePaths[index],
                                width: 130,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.imageTexts[index],
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              // Video Section with "Book Now" Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Prateek Kuhad - Silhouettes Tour',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'A Grand 10-City India Tour! Are you ready for the magic of "Yeh Pal"?',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 16),
                      // Video Player Below Text
                      _videoController.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _videoController.value.aspectRatio,
                              child: VideoPlayer(_videoController),
                            )
                          : const Center(child: CircularProgressIndicator()),
                      const SizedBox(height: 12),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your button logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // Button color
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                              vertical: 12.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Book Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Entertainment Section
              EntertainmentSection(),

              // New Container Section with Horizontal Scrolling Images

              // Horizontal Categories Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Now You Can Order Yummy Yummy Food!!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildCard('assets/food1.jpg', 'Burger'),
                          _buildCard('assets/food2.jpg', 'Popcorn'),
                          _buildCard('assets/food3.jpg','Nachos'),
                          _buildCard('assets/food4.jpg','Pizza'),
                          _buildCard('assets/food5.jpg','Potato Chips'),
                          _buildCard('assets/food6.jpg','Fries'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Think Fun, Think Comedy",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Here's what we've put together for you",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // First Row: 4 Images with Horizontal Scroll
                      SizedBox(
                        height: 130, // Set height for images
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                // Rounded corners
                                child: Image.asset(
                                  widget.todo[index],
                                  width: 250,
                                  height: 100, // Replace with your image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Second Row: 7 Images with Horizontal Scroll
                      // Second Row: 7 Images with Horizontal Scroll
                      SizedBox(
                        height: 130, // Set height for images
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                // Corrected image reference
                                child: Image.asset(
                                  widget.dot[index],
                                  // Use widget.dot[index] here
                                  width: 150,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Get Set For The Weekend", // Correcting the typo in "Weekend"
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // First image with text
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0), // Add padding around the image
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0), // Add rounded corners
                                  // Optional, background color
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0), // Ensure the image has rounded corners
                                  child: Image.asset(
                                    'assets/week1.jpg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text("Comedy Shows"), // Text below the image
                            ],
                          ),
                          const SizedBox(width: 8),
                          // Second image with text
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset(
                                    'assets/week2.jpg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text("Plays and Performance"),
                            ],
                          ),
                          const SizedBox(width: 8),
                          // Repeat similar structure for other images
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset(
                                    'assets/week3.jpg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text("Adventure"),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset(
                                    'assets/week4.jpg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text("Amusement"),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset(
                                    'assets/week5.jpg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text("Music Shows"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ));
  }

  Widget _buildCard(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 150,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class EntertainmentSection extends StatelessWidget {
  final List<Map<String, String>> slides = [
    {'image': 'assets/ent1.jpg', 'text': 'Movie Night'},
    {'image': 'assets/ent2.jpg', 'text': 'Music Concert'},
    {'image': 'assets/ent3.jpg', 'text': 'Standup Comedy'},
    {'image': 'assets/ent4.jpg', 'text': 'Theater Play'},
  ];

  EntertainmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Discover Entertainment",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Experience the best shows and performances.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
              ),
              items: slides.map((slide) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            slide['image']!,
                            width: 400,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          slide['text']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your button logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 12.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: EventPage()));
}

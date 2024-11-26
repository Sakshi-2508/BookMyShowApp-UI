import 'package:flutter/material.dart';

void main() {
  runApp(MoviePage());
}

class MoviePage extends StatelessWidget {
  MoviePage({super.key});

  final List<String> languages = [
    'Hindi',
    'English',
    'Kannada',
    'Marathi',
    'Tamil'
  ];

  final List<String> movieImages = [
    'assets/pic.jpg',
    'assets/pic2.jpg',
    'assets/pic3.jpg',
    'assets/pic4.jpg',
    'assets/pic5.jpg',
    'assets/pic6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Now Showing'),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HorizontalImageSlider(),
              const SizedBox(height: 10),
              LanguageBadges(languages: languages),
              const SizedBox(height: 10),
              BannerImage(),
              const SizedBox(height: 10),
              MovieGrid(movieImages: movieImages), // Movie grid with scrolling
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalImageSlider extends StatelessWidget {
  const HorizontalImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
        child: Row(
          children: [
            Image.asset('assets/prime.jpg', width: 340, height: 200, fit: BoxFit.cover),
            const SizedBox(width: 10),
            Image.asset('assets/prime1.jpg', width: 340, height: 200, fit: BoxFit.cover),
            const SizedBox(width: 10),
            Image.asset('assets/prime2.jpg', width: 340, height: 200, fit: BoxFit.cover),
            const SizedBox(width: 10),
            Image.asset('assets/prime3.jpg', width: 340, height: 200, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}

class LanguageBadges extends StatelessWidget {
  final List<String> languages;

  const LanguageBadges({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: languages.map((language) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Chip(
              label: Text(language),
              backgroundColor: Colors.white,

            ),
          );
        }).toList(),
      ),
    );
  }
}

class BannerImage extends StatelessWidget {
  const BannerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Image.asset(
        'assets/soon.jpg', // Update with your banner image path
        width: double.infinity,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}

class MovieGrid extends StatelessWidget {
  final List<String> movieImages;

  const MovieGrid({super.key, required this.movieImages});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Let the grid take only the required space
      physics: const NeverScrollableScrollPhysics(), // Disable internal scrolling in the grid
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 8.0, // Space between columns
        mainAxisSpacing: 8.0, // Space between rows
        childAspectRatio: 0.9, // Increase this value to reduce image height
      ),
      itemCount: movieImages.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0), // Add margin around each item
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0), // Rounded corners for the image
            child: Image.asset(
              movieImages[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}


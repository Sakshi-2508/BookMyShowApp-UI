import 'package:bookmyshow/events.dart';
import 'package:bookmyshow/homepage2.dart';
import 'package:bookmyshow/moviespage.dart';
import 'package:bookmyshow/profile.dart';
import 'package:flutter/material.dart';

import 'images.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  int _currentIndex = 0; // To track selected bottom navigation item
  final List<Widget> _pages = [
    const Homepage2(),
    MoviePage(),
    EventPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.local_offer), label: 'Offers'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.redAccent,
      ),
    );
}


}

import 'package:bookmyshow/moviespage.dart';
import 'package:bookmyshow/profile.dart';
import 'package:flutter/material.dart';

import 'events.dart';
import 'homepage.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE6E6FA)),
        useMaterial3: true,
      ),
      home:    Homepage(),
    );
  }
}

class EventsPage {
}

class MyHomePage {
  const MyHomePage();
}

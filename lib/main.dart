import 'package:flutter/material.dart';
import 'Screens/home.dart';
import 'splash_screen.dart'; // Import your splash screen file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meme Sound Effects',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Use SplashScreen as the initial screen
      routes: {
        '/home': (context) => Home(), // Define the route for Home screen
      },
    );
  }
}

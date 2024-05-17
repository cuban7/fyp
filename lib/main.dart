import 'package:flutter/material.dart';
import 'package:fyp_academic_calendar/Student/stddashboard.dart';
import 'package:fyp_academic_calendar/extra.dart';
import 'package:fyp_academic_calendar/loginscreen.dart';

import 'package:fyp_academic_calendar/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      // home: extra(),
      home: SplashScreen(),
      routes: {
        '/LoginScreen': (context) => LoginScreen(),
        '/stdDashboard': (context) => stdDashboard(),
      },
    );
  }
}

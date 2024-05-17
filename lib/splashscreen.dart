import 'package:flutter/material.dart';
import 'package:fyp_academic_calendar/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      )
      );
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height * 0.3), // Adjust the height as needed
        const Text(
          'BIIT ACADEMIC CALENDAR',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 40),
        Center(
          child: Image.asset('assets/splashscreen.png', width: 200, height: 200),
        ),
      ],
    ),
  );
}


}

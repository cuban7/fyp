// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp_academic_calendar/DataCell/datacell_dashboard.dart';

import 'package:fyp_academic_calendar/Director/directorDashboard.dart';
import 'package:fyp_academic_calendar/Student/stddashboard.dart';
import 'package:fyp_academic_calendar/SystemAdmin/saDashboard.dart';

import 'package:fyp_academic_calendar/Teacher/teacherDashboard.dart';
import 'package:fyp_academic_calendar/Societies/societyDashboard.dart';

import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool _passwordVisible = false;
  String errorMessage = '';

  void login() async {
    String username = name.text;
    String password = pass.text;

    final apiUrl =
        'http://192.168.0.119/fyp_1/api/Authorization/signin?name=${username}&pass=${password}'; // Replace port with your actual port number
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        // 'Username': username,
        // 'Password': password,
      });
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData == 'false') {
          setState(() {
            errorMessage = 'Incorrect username or password';
          });
        } else {
          print(responseData);
        }

        // Check username and password and navigate to respective screens
        if (responseData['Roles'] == 'Student') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => stdDashboard()),
          );
        } else if (responseData['Roles'] == 'Teacher') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => teacherDashboard()),
          );
        } else if (responseData['Roles'] == 'Datacell') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DatacellDashboard()),
          );
        } else if (responseData['Roles'] == 'Director') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => directorDashboard()),
          );
        } else if (responseData['Roles'] == 'Societies') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SocietieseDashboard()),
          );
        } else if (responseData['Roles'] == 'System Admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SystemAdminDashboard()),
          );
        } else {
          // Show error message for invalid credentials
          setState(() {
            errorMessage = 'Incorrect username or password';
          });
        }
      }
    } catch (error) {
      setState(() {
        errorMessage = 'An error occurred: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal[800],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Login',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Image.asset('assets/splashscreen.png', width: 120, height: 120),
            const SizedBox(height: 16),
            TextField(
              controller: name,
              decoration: const InputDecoration(
                hintText: 'Username',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: pass,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                hintText: 'Password',
                fillColor: Colors.white,
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 8),
            errorMessage.isNotEmpty
                ? Expanded(
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : SizedBox(),
            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forget Password?',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

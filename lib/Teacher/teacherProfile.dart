import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:fyp_academic_calendar/Teacher/teacherDS.dart';
import 'package:fyp_academic_calendar/Teacher/teacherNoti.dart';
import 'package:fyp_academic_calendar/Teacher/teacherSP.dart';
import 'package:fyp_academic_calendar/Teacher/teacherTT.dart';
import 'package:fyp_academic_calendar/loginscreen.dart';
import 'package:http/http.dart' as http;

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({Key? key}) : super(key: key);

  @override
  _StdProfileState createState() => _StdProfileState();
}

class _StdProfileState extends State<TeacherProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _QualificationController =
      TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _QualificationController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    final response = await http.get(
        Uri.parse('http://192.168.1.154/fyp_1/api/Teacher/Profile?userId=1'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData =
          json.decode(response.body); //decode= data from database to frontend
      setState(() {
        _nameController.text = responseData['Name'].toString();
        _QualificationController.text =
            responseData['Qualification'].toString();
        _experienceController.text = responseData['Experience'] != null
            ? responseData['Experience'].toString()
            : "N/A";
      });
    } else {
      throw Exception('Failed to load profile data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          const Text('Teacher Dashboard',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(width: 60),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.yellow,
            ), // Notification icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherNoti()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text('Teacher'),
          ),
          ListTile(
            title: const Text('Teacher Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherProfile()),
              );
            },
          ),
          ListTile(
            title: const Text('Teacher Timetable'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherTimetable()),
              );
            },
          ),
          ListTile(
            title: const Text('Teacher DateSheet'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherDatesheet()),
              );
            },
          ),
          ListTile(
            title: const Text('Teacher Sitting Plan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherSittingPlan()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                // Wrapping the avatar in a Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/download.jpg'),
                      radius: 50,
                    ),
                    const SizedBox(
                        width:
                            20), // Add some space between the avatar and text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('BIIT Academic Calendar',
                            style: TextStyle(fontSize: 18)),
                        Text('2023-2024',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // const SizedBox(height: 5),
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                // Add some space between the avatar and text
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildTextField("Name", _nameController),
            _buildTextField("Qualification", _QualificationController),
            _buildTextField("Experience", _experienceController),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100, // Adjust the width according to your preference
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black),
              enabled: controller.text != null && controller.text.isNotEmpty,
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fyp_academic_calendar/Director/datesheet.dart';
import 'package:fyp_academic_calendar/Director/directorNoti.dart';
import 'package:fyp_academic_calendar/Director/directorSP.dart';

import 'package:fyp_academic_calendar/Director/studentTT.dart';
import 'package:fyp_academic_calendar/Director/teacherTT.dart';
import 'package:fyp_academic_calendar/loginscreen.dart';

class teacherTT extends StatefulWidget {
  const teacherTT({Key? key}) : super(key: key);

  @override
  _datesheetState createState() => _datesheetState();
}

class _datesheetState extends State<teacherTT> {
  final TextEditingController _disciplineController = TextEditingController();
  File? _selectedFile;

  @override
  void dispose() {
    _disciplineController.dispose();
    super.dispose();
  }

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  void _clearFields() {
    _disciplineController.clear();
  }

  void _updateDiscipline(String value) {
    setState(() {
      _disciplineController.text = value;
    });
  }

  void _onSearchPressed() {
    // Implement your search functionality here
  }

  void _onFilterPressed() {
    // Implement your filter functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications), // Notification icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DirectorNoti()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text('Director'),
          ),
          ListTile(
            title: const Text('DateSheet'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const datesheet()),
              );
            },
          ),
          ListTile(
            title: const Text('Sitting Plan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const sittingplan()),
              );
            },
          ),
          ListTile(
            title: const Text('Teacher Timetable'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const teacherTT()),
              );
            },
          ),
          ListTile(
            title: const Text('Student TimeTable'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const studentTT()),
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
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 20),
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/download.jpg'),
                    radius: 50,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('Director Dashboard',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
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
          const SizedBox(height: 20),
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              // Add some space between the avatar and text
            ],
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Teacher's Timetable",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Filter and Search Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.tune), // Filter icon button
                        onPressed: _onFilterPressed,
                      ),
                    ],
                  ),
            
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

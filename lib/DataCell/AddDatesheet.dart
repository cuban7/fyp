// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:fyp_academic_calendar/DataCell/addStudentTT.dart';
import 'package:fyp_academic_calendar/DataCell/addTeachersTT.dart';

import 'package:fyp_academic_calendar/DataCell/notifications.dart';
import 'package:fyp_academic_calendar/DataCell/AddSittingPlan.dart';
import 'package:fyp_academic_calendar/loginscreen.dart';

class AddDatesheet extends StatefulWidget {
  @override
  _MyFormScreenState createState() => _MyFormScreenState();
}

class _MyFormScreenState extends State<AddDatesheet> {
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _textController3 = TextEditingController();
  final TextEditingController _fileController = TextEditingController();

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _fileController.dispose();
    super.dispose();
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
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text('Datacell'),
          ),
          ListTile(
            title: const Text('Add Date Sheet'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDatesheet()),
              );
            },
          ),
          ListTile(
            title: const Text('Add seating Plan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addSittingplan()),
              );
            },
          ),
          ListTile(
            title: const Text('Add Teachers Timetable'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addTeachersTT()),
              );
            },
          ),
          ListTile(
            title: const Text('Add Students TimeTable'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  addStudentsTT()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              // Add your logout logic here
              // For example, you can navigate to the login screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  LoginScreen()),
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
              // Wrapping the avatar in a Row
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/download.jpg'),
                    radius: 50,
                  ),
                  const SizedBox(
                      width: 20), // Add some space between the avatar and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('DataCell Dashboard',
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
                    "Add Date Sheet",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField("Title", _textController1),
                  _buildTextField("Start Date", _textController2),
                  _buildTextField("End Date", _textController3),
                  _buildFileUploadField("Date Sheet", _fileController),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ]),
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

  Widget _buildFileUploadField(String label, TextEditingController controller) {
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
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.black),
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
                IconButton(
                  onPressed: () {
                    // Add upload file logic here
                  },
                  icon: Icon(Icons.upload_file),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    String text1 = _textController1.text;
    String text2 = _textController2.text;
    String text3 = _textController3.text;
    String uploadedFile = _fileController.text;

    // Perform actions with the form data
    print('Title: $text1');
    print('Start Date: $text2');
    print('End Date: $text3');
    print('Uploaded File: $uploadedFile');

    // Reset text fields after submission
    _textController1.clear();
    _textController2.clear();
    _textController3.clear();
    _fileController.clear();
  }
}

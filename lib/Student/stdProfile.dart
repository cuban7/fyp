import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp_academic_calendar/Student/stdDatesheet.dart';
import 'package:fyp_academic_calendar/Student/stdNoti.dart';
import 'package:fyp_academic_calendar/Student/stdSittingplan.dart';
import 'package:fyp_academic_calendar/Student/stdTimetable.dart';
import 'package:fyp_academic_calendar/loginscreen.dart';
import 'package:http/http.dart' as http;

class stdProfile extends StatefulWidget {
  const stdProfile({Key? key}) : super(key: key);

  @override
  _StdProfileState createState() => _StdProfileState();
}

class _StdProfileState extends State<stdProfile> {
  final TextEditingController _aridController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _DisciplineController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    _aridController.dispose();
    _nameController.dispose();
    _DisciplineController.dispose();
    _semesterController.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    final response = await http.get(
        Uri.parse('http://192.168.0.119/fyp_1/api/Student/Profile?userId=1'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData =
          json.decode(response.body); //decode= data from database to frontend
      setState(() {
        _aridController.text =
            responseData['ARIDNo'].toString(); //tostring=for managing datatypes
        _nameController.text = responseData['Name'].toString();
        _DisciplineController.text = responseData['Discipline'].toString();
        _semesterController.text = responseData['Semester'] != null
            ? responseData['Semester'].toString()
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
          const Text('Student Dashboard',
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
                MaterialPageRoute(builder: (context) => stdNoti()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text('Student'),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => stdProfile()),
              );
            },
          ),
          ListTile(
            title: const Text('Timetable'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => stdTimetable()),
              );
            },
          ),
          ListTile(
            title: const Text('DateSheet'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => stdDatesheet()),
              );
            },
          ),
          // ListTile(
          //   title: const Text('Seating Plan'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => stdSittingPlan()),
          //     );
          //   },
          // ),
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
                        Text('2023',
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
            _buildTextField("ARID No.", _aridController),
            _buildTextField("Name", _nameController),
            _buildTextField("Discipline", _DisciplineController),
            _buildTextField("Semester", _semesterController),
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp_academic_calendar/Societies/addrole.dart';
import 'package:fyp_academic_calendar/Societies/addupdate_event.dart';
import 'package:fyp_academic_calendar/Societies/advNoti.dart';
import 'package:fyp_academic_calendar/Societies/studentAffair.dart';
import 'package:fyp_academic_calendar/loginscreen.dart';
import 'package:http/http.dart' as http;

class addmember extends StatefulWidget {
  @override
  State<addmember> createState() => _addupdateEventState();
}

class _addupdateEventState extends State<addmember> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _semController = TextEditingController();
  String Selected_aridno = '';
  List<String> _roles = [];
  List<String> _filteredaridno = [];

  void initState() {
    super.initState();
    fetchAridno();
  }

  Future<void> fetchAridno() async {
    final response = await http
        .get(Uri.parse('http://192.168.0.119/fyp_1/api/Society/StudentAridno'));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      List<dynamic> aridNoList = responseData['ARIDNo'];
      setState(() {
        _roles.clear();
        _roles.addAll(aridNoList.map((e) => e.toString())); // Convert to string
      });
    } else {
      throw Exception('Failed to load profile data');
    }
  }

  @override
  void dispose() {
    // _aridnoController.dispose();
    _nameController.dispose();
    _degreeController.dispose();
    _semController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Societies Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.yellow,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SocietyNotification()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text('Societies Dashboard'),
          ),
          ListTile(
            title: const Text('Add/Update Event'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addupdateEvent()),
              );
            },
          ),
          ListTile(
            title: const Text('Add Role'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addrole()),
              );
            },
          ),
          ListTile(
            title: const Text('Add Member'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addmember()),
              );
            },
          ),
          ListTile(
            title: const Text('Student Affair'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => stdAffair()),
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
                MaterialPageRoute(builder: (context) => const LoginScreen()),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/download.jpg'),
                      radius: 50,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
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
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Text(
                  'Add Member',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _SEARCHField('Arid No'),
            _buildTextField("Name", _nameController),
            _buildTextField("Degree", _degreeController),
            _buildTextField("Semester", _semController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your button functionality here
              },
              child:
                  const Text('Submit', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade900,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool hasSearchButton = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black),
              enabled: false,
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
          if (hasSearchButton && label == "Arid No:")
            SizedBox(
              width: 80,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  // Add your search functionality here
                },
                child: Text('Search', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green.shade900,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.zero,
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget _SEARCHField(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

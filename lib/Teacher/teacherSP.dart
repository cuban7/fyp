import 'package:flutter/material.dart';
import 'package:fyp_academic_calendar/Teacher/teacherDS.dart';
import 'package:fyp_academic_calendar/Teacher/teacherNoti.dart';
import 'package:fyp_academic_calendar/Teacher/teacherProfile.dart';
import 'package:fyp_academic_calendar/Teacher/teacherTT.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fyp_academic_calendar/loginscreen.dart';

class TeacherDutySheet extends StatefulWidget {
  @override
  _DateSheetState createState() => _DateSheetState();
}

class _DateSheetState extends State<TeacherDutySheet> {
  List<String> daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List<TextEditingController> controllers =
      List.generate(8, (_) => TextEditingController());

  _DateSheetState() {
    fetchSeatingPlan();
  }

  String day = ''; // Variable to hold the day
  String date = ''; // Variable to hold the date
  List<dynamic> seatingPlan = [];
  Future<void> fetchSeatingPlan() async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.0.119/fyp_1/api/Teacher/SeatingPlan?userId=1'));

      if (response.statusCode == 200) {
        print('Seating Plan API response: ${response.body}');

        setState(() {
          seatingPlan = json.decode(response.body);
          seatingPlan.sort((a, b) => a['Date'].compareTo(b['Date']));
        });
      } else {
        throw Exception('Failed to load seating plan');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      fetchSeatingPlan();
    }

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
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherProfile()),
              );
            },
          ),
          // ListTile(
          //   title: const Text('Timetable'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => TeacherTimetable()),
          //     );
          //   },
          // ),
          // ListTile(
          //   title: const Text('DateSheet'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => TeacherDatesheet()),
          //     );
          //   },
          // ),
          ListTile(
            title: const Text('DutySheet'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherDutySheet()),
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
                  'DutySheet',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Adding space between title and table
            buildTimetable(),
          ],
        ),
      ),
    );
  }

  Widget buildTimetable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: {
        0: FractionColumnWidth(0.24),
        1: FractionColumnWidth(0.27),
        2: FractionColumnWidth(0.17),
        3: FractionColumnWidth(0.17),
        4: FractionColumnWidth(0.17),
        5: FractionColumnWidth(0.17),
      },
      children: [
        TableRow(
          children: [
            _buildTableCell('Date', isHeader: true),
            _buildTableCell('Day', isHeader: true),
            _buildTableCell('Venue', isHeader: true),
            _buildTableCell('Slot', isHeader: true),
            // _buildTableCell('Morning', isHeader: true),
          ],
        ),
        if (seatingPlan != null)
          for (var rowData in seatingPlan ?? [])
            TableRow(
              children: [
                _buildTableCell(rowData['Date'] ?? ''),
                _buildTableCell(rowData['Day'] ?? ''),
                _buildTableCell(rowData['Venue'] ?? ''),
                _buildTableCell(rowData['Slot'] ?? ''),
                // _buildTableCell(rowData['Morning'] ?? ''),
              ],
            ),
      ],
    );
  }

  TableCell _buildTableCell(String text, {bool isHeader = false}) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }

  TableRow _buildTableRow(
      String time, String mon, String tue, String wed, String thu, String fri) {
    return TableRow(
      children: [
        _buildTableCell(time),
        _buildTableCell(mon),
        _buildTableCell(tue),
        _buildTableCell(wed),
        _buildTableCell(thu),
        _buildTableCell(fri),
      ],
    );
  }
}

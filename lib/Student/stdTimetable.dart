import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp_academic_calendar/Student/stdDatesheet.dart';
import 'package:fyp_academic_calendar/Student/stdNoti.dart';
import 'package:fyp_academic_calendar/Student/stdProfile.dart';
import 'package:fyp_academic_calendar/Student/stdSittingplan.dart';

import 'package:fyp_academic_calendar/loginscreen.dart';
import 'package:http/http.dart' as http;

class stdTimetable extends StatefulWidget {
  @override
  _DateSheetState createState() => _DateSheetState();
}

class _DateSheetState extends State<stdTimetable> {
  List<String> daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List<TextEditingController> controllers =
      List.generate(8, (_) => TextEditingController());

  _DateSheetState() {
    fetchTimetable();
  }

  String day = ''; // Variable to hold the day
  String date = ''; // Variable to hold the date

  List<dynamic> timetable = [];

  Future<void> fetchTimetable() async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.0.119/fyp_1/api/Student/Timetable?aridno=AR12345'));

      if (response.statusCode == 200) {
        print('Timetable API response: ${response.body}');

        setState(() {
          timetable = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load timetable');
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
      fetchTimetable();
    }

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
                  'Timetable',
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
        0: FractionColumnWidth(0.16),
        1: FractionColumnWidth(0.17),
        2: FractionColumnWidth(0.17),
        3: FractionColumnWidth(0.17),
        4: FractionColumnWidth(0.17),
        5: FractionColumnWidth(0.17),
      },
      children: [
        TableRow(
          children: [
            _buildTableCell('Time', isHeader: true),
            _buildTableCell('Mon', isHeader: true),
            _buildTableCell('Tue', isHeader: true),
            _buildTableCell('Wed', isHeader: true),
            _buildTableCell('Thu', isHeader: true),
            _buildTableCell('Fri', isHeader: true),
          ],
        ),
        if (timetable != null)
          for (var rowData in timetable ?? [])
            TableRow(children: [
              _buildTableCell(rowData['timeslot'] ?? ''),
              _buildTableCell(rowData['MondayInfo']['allinfo'] ?? ''),
              _buildTableCell(rowData['TuesdayInfo']['allinfo'] ?? ''),
              _buildTableCell(rowData['WednesdayInfo']['allinfo'] ?? ''),
              _buildTableCell(rowData['ThursdayInfo']['allinfo'] ?? ''),
              _buildTableCell(rowData['FridayInfo']['allinfo'] ?? ''),
            ])
      ],
    );
  }

  TableCell _buildTableCell(String text, {bool isHeader = false}) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            fontSize: 10.0,
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(
      String time, String mon, String tue, String wed, String thu, String fri) {
    return TableRow(
      children: [
        // _buildTableCell(time),
        _buildTableCell(
            mon ?? ''), // Check for null values and provide a default value
        _buildTableCell(
            tue ?? ''), // Check for null values and provide a default value
        _buildTableCell(
            wed ?? ''), // Check for null values and provide a default value
        _buildTableCell(
            thu ?? ''), // Check for null values and provide a default value
        _buildTableCell(
            fri ?? ''), // Check for null values and provide a default value
      ],
    );
  }
}

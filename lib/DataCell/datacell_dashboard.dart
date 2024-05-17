import 'package:flutter/material.dart';
import 'package:fyp_academic_calendar/DataCell/AddDatesheet.dart';
import 'package:fyp_academic_calendar/DataCell/AddSittingPlan.dart';
import 'package:fyp_academic_calendar/DataCell/addStudentTT.dart';
import 'package:fyp_academic_calendar/DataCell/addTeachersTT.dart';
import 'package:fyp_academic_calendar/DataCell/notifications.dart';

import 'package:fyp_academic_calendar/Student/tab/tab_count/event_tab_for_student.dart';
import 'package:fyp_academic_calendar/Student/tab/tab_count/semester_tab_student.dart';
import 'package:fyp_academic_calendar/Student/tab/tab_count/year_tab_for_student.dart';
import 'package:fyp_academic_calendar/Student/tab/tab_count/month_tab_for_std.dart';
import 'package:fyp_academic_calendar/loginscreen.dart';

class DatacellDashboard extends StatefulWidget {
  const DatacellDashboard({Key? key}) : super(key: key);

  @override
  _CalendarAppState createState() => _CalendarAppState();
}

class _CalendarAppState extends State<DatacellDashboard> {
  int _selectedIndex = 0;
  int _selectedMonth = 0;
  int _selectedYear = 2024; // Default selected year

  List<DateTime> holidays = [
    DateTime(2024, 5, 1), // Labor Day (May 1st)
    for (int i = 1; i <= 12; i++)
      for (int j = 1; j <= 31; j++)
        if (DateTime(2024, i, j).weekday == DateTime.sunday)
          DateTime(2024, i, j), // Sundays (Every Sunday for the year)
  ];

  List<DateTime> examDates = [
    DateTime(2024, 1, 10), DateTime(2024, 1, 11), DateTime(2024, 1, 12),
    DateTime(2024, 1, 13), DateTime(2024, 1, 14), DateTime(2024, 1, 15),
    DateTime(2024, 1, 16),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          const Text('DataCell Dashboard',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(width: 60),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.grey,
            ), // Notification icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationScreen()),
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
                MaterialPageRoute(builder: (context) => addStudentsTT()),
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
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                // Wrapping the avatar in a Row
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/download.jpg'),
                        radius: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ), // Add some space between the avatar and text
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 150,
                            child: Text('BIIT Academic Calendar',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700)),
                          ),
                          Text('2023-2024',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700)),
                        ],
                      ),
                      PopupMenuButton<String>(
                        icon: const Icon(
                            Icons.more_vert), // Icon for the dropdown button
                        onSelected: (String value) {
                          // Handle menu item selection
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          // Define the dropdown options
                          const PopupMenuItem<String>(
                            value: 'All Events',
                            child: Text('All Events'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'My Events',
                            child: Text('My Events'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Exams',
                            child: Text('Exams'),
                          ),
                          // Add more options as needed
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
                height:
                    10), // Add some space between the content and the tab bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TabItem(
                  text: 'Year',
                  index: 0,
                  isSelected: _selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                TabItem(
                  text: 'Semester',
                  index: 1,
                  isSelected: _selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
                TabItem(
                  text: 'Month',
                  index: 2,
                  isSelected: _selectedIndex == 2,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                ),
                TabItem(
                  text: 'Event',
                  index: 3,
                  isSelected: _selectedIndex == 3,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                ),
              ],
            ),
            // Display content based on selected tab
            if (_selectedIndex == 0)
              YearCalendarStd(
                selectedYear: _selectedYear,
                holidays: holidays,
                examDates: examDates,
                onMonthSelected: (monthNumber) {
                  setState(() {
                    _selectedMonth = monthNumber;
                    _selectedIndex = 2; // Switch to the month tab
                  });
                },
                eventDates: [],
              ),
            if (_selectedIndex == 1)
              SemesterCalendarStudent(
                selectedYear: _selectedYear,
                holidays: holidays,
                examDates: examDates,
                eventDates: [],
              ),
            if (_selectedIndex == 2)
              MonthTabStd(
                selectedYear: _selectedYear,
                holidays: holidays,
                examDates: examDates,
                selectedMonth: _selectedMonth,
                eventDates: [],
              ),
            if (_selectedIndex == 3) EventTabForStudent()

            // Add conditions for displaying other content based on other tabs if needed
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String text;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const TabItem({
    required this.text,
    required this.index,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade900 : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

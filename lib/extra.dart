import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp_academic_calendar/Student/stdDatesheet.dart';
import 'package:fyp_academic_calendar/Student/stdNoti.dart';
import 'package:fyp_academic_calendar/Student/stdProfile.dart';
import 'package:fyp_academic_calendar/Student/stdSittingplan.dart';
import 'package:fyp_academic_calendar/Student/stdTimetable.dart';

import 'package:fyp_academic_calendar/loginscreen.dart';
import 'package:intl/intl.dart';

import 'package:table_calendar/table_calendar.dart';

class extra extends StatefulWidget {
  const extra({Key? key}) : super(key: key);

  @override
  _CalendarAppState createState() => _CalendarAppState();
}

class _CalendarAppState extends State<extra> {
  int _selectedIndex = 0;
  int _selectedYear = 2024; // Default selected year

  // Define a list of event dates for the year 2024
  List<DateTime> eventDates = [
    DateTime(2024, 1, 15),
    DateTime(2024, 2, 20),
    DateTime(2024, 3, 10),
    // Add more event dates as needed
  ];

  // Define a list of holidays including Sundays and other specific holidays for the year
  List<DateTime> holidays = [
    // Labor Day (May 1st)
    DateTime(2024, 5, 1),
    // Sundays (Every Sunday for the year)
    for (int i = 1; i <= 12; i++)
      for (int j = 1; j <= 31; j++)
        if (DateTime(2024, i, j).weekday == DateTime.sunday)
          DateTime(2024, i, j),
    // Add more specific holidays as needed
  ];

  // Define a list of exam dates for the year 2024
  List<DateTime> examDates = [
    // Exam period (January 10th to January 16th)
    DateTime(2024, 1, 10),
    DateTime(2024, 1, 11),
    DateTime(2024, 1, 12),
    DateTime(2024, 1, 13),
    DateTime(2024, 1, 14),
    DateTime(2024, 1, 15),
    DateTime(2024, 1, 16),
    // Add more exam dates as needed
  ];

  // Options for the dropdown filter
  List<String> filterOptions = ["My Events", "All Events", "Exams"];
  String selectedFilterOption = "My Events"; // Default selected filter option

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
          ListTile(
            title: const Text('Sitting Plan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => stdSittingPlan()),
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
            // const SizedBox(height: 20),
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
                          width:
                              10), // Add some space between the avatar and text
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
                          // Text('Student Dashboard',
                          //     style: TextStyle(
                          //         fontSize: 14, fontWeight: FontWeight.bold)),

                          Text('2023',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700)),
                        ],
                      ),
                      PopupMenuButton<String>(
                        icon: Icon(
                            Icons.more_vert), // Icon for the dropdown button
                        onSelected: (String value) {
                          // Define behavior for when an option is selected
                          print('Selected: $value');
                          // Navigate based on the selected option
                          if (value == 'All Events') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllEventsScreen()),
                            );
                          } else if (value == 'My Events') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyEventsScreen()),
                            );
                          } else if (value == 'Exams') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExamsScreen()),
                            );
                          }
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
            // Add a row with four tabs
            Row(
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
                  text: 'Events',
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
            const SizedBox(height: 10),
            // Display content based on selected tab
            if (_selectedIndex == 0)
              YearCalendar(
                selectedYear: _selectedYear,
                eventDates: eventDates,
                holidays: holidays,
                examDates: examDates,
              ),

            if (_selectedIndex == 1)
              SemesterCalendar(
                selectedYear: _selectedYear,
                eventDates: eventDates,
                holidays: holidays,
                examDates: examDates,
              ),
            if (_selectedIndex == 2)
              MonthCalendar(
                month: DateTime.now().month, // Display current month
                year: _selectedYear,
                eventDates: eventDates,
                holidays: holidays,
                examDates: examDates,
              ),
            SizedBox(
              height: 10,
            ),

            if (_selectedIndex == 3) EventsTab(),

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
    Key? key,
    required this.text,
    required this.index,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          // decoration: BoxDecoration(
          //   border: Border.all(
          //       color: isSelected ? Colors.green.shade900 : Colors.grey),
          //   borderRadius: BorderRadius.circular(8),
          // ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  // color: isSelected ? Colors.green.shade900 : Colors.black),
                  color: isSelected ? Colors.green.shade900 : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class YearCalendar extends StatelessWidget {
  final int selectedYear;
  final List<DateTime> eventDates;
  final List<DateTime> holidays; // List of holidays
  final List<DateTime> examDates; // List of exam dates

  const YearCalendar({
    Key? key,
    required this.selectedYear,
    required this.eventDates,
    required this.holidays,
    required this.examDates, // Include examDates parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> fruits = [
      {
        'name': 'Feb 19 - Mar 17',
        'title': 'Registration of Courses and  Orientation'
      },
      {'name': 'Feb 19 - July 6', 'title': 'Semester Duration'},
      {'name': 'May 6 - May 11', 'title': 'Student Week'},
      {
        'name': 'April 20 - April 26 &  july 01 - july 06',
        'title': 'Mid Semester  & End  Semester Eximations'
      },
      {'name': 'July 8 - July 28', 'title': 'Semester End Break'},
      {'name': '', 'title': 'National Holiday'},
    ];
    final List<Color> tileColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
    ];

    // List of colors
    final List<Color> textColors = [
      Colors.white,
      Colors.white,
      Colors.white,
    ];
    final List<String> names2 = [
      'semester End Break',
      'Orientation',
    ];

    // List of colors
    final List<Color> textColors2 = [
      Colors.white,
      Colors.white,
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildYearCalendar(selectedYear, eventDates, holidays,
                    examDates), // Pass examDates here
                const SizedBox(width: 20),

                // _buildYearCalendar(selectedYear + 1, eventDates, holidays), // You can include this if needed
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: fruits.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final Color color = tileColors[index % tileColors.length];

              return Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: color,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      fruits[index]['name'] ?? '',
                      style: const TextStyle(fontSize: 8, color: Colors.black),
                    ),
                    Text(
                      fruits[index]['title'] ?? '',
                      style: const TextStyle(fontSize: 10, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              );
              //   ListTile(
              //   title: Text(fruits[index]['name'] ?? ''),
              //   subtitle: Text(fruits[index]['title'] ?? ''),
              //   // You can add more customization here as needed
              // );
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  static Widget _buildYearCalendar(int year, List<DateTime> eventDates,
      List<DateTime> holidays, List<DateTime> examDates) {
    List<Widget> rows = [];
    for (int month = 2; month <= 12; month += 3) {
      int nextMonth = month + 1;
      int secondMonth = nextMonth + 1;
      int thirs = secondMonth + 1;
      if (nextMonth <= 12) {
        rows.add(Row(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: MonthCalendar(
            //       month: month,
            //       year: year,
            //       eventDates: eventDates,
            //       holidays: holidays,
            //       examDates: examDates),
            // ),
            SizedBox(
              width: 5,
            ),
            MonthCalendar(
                month: month,
                year: year,
                eventDates: eventDates,
                holidays: holidays,
                examDates: examDates),
            MonthCalendar(
                month: nextMonth,
                year: year,
                eventDates: eventDates,
                holidays: holidays,
                examDates: examDates),
            MonthCalendar(
                month: secondMonth,
                year: year,
                eventDates: eventDates,
                holidays: holidays,
                examDates: examDates),
            SizedBox(
              width: 5,
            ),

            // MonthCalendar(
            //     month: nextMonth,
            //     year: year,
            //     eventDates: eventDates,
            //     holidays: holidays,
            //     examDates: examDates),
          ],
        ));
      } else {
        rows.add(MonthCalendar(
            month: month,
            year: year,
            eventDates: eventDates,
            holidays: holidays,
            examDates: examDates));
      }
    }
    return Column(children: rows);
  }
}

class SemesterCalendar extends StatelessWidget {
  final int selectedYear;
  final List<DateTime> eventDates;
  final List<DateTime> holidays; // List of holidays
  final List<DateTime> examDates; // List of exam dates

  const SemesterCalendar({
    Key? key,
    required this.selectedYear,
    required this.eventDates,
    required this.holidays,
    required this.examDates, // Include examDates parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildYearCalendar(selectedYear, eventDates, holidays,
              examDates), // Pass examDates here
          const SizedBox(width: 20),
          // _buildYearCalendar(selectedYear + 1, eventDates, holidays), // You can include this if needed
        ],
      ),
    );
  }

  static Widget _buildYearCalendar(int year, List<DateTime> eventDates,
      List<DateTime> holidays, List<DateTime> examDates) {
    List<Widget> rows = [];
    for (int month = 1; month <= 8; month += 2) {
      int nextMonth = month + 1;
      if (nextMonth <= 8) {
        rows.add(Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MonthCalendar(
                  month: month,
                  year: year,
                  eventDates: eventDates,
                  holidays: holidays,
                  examDates: examDates),
            ),
            const SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MonthCalendar(
                  month: nextMonth,
                  year: year,
                  eventDates: eventDates,
                  holidays: holidays,
                  examDates: examDates),
            ),
          ],
        ));
      } else {
        rows.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: MonthCalendar(
              month: month,
              year: year,
              eventDates: eventDates,
              holidays: holidays,
              examDates: examDates),
        ));
      }
    }
    return Column(children: rows);
  }
}

class MonthCalendar extends StatelessWidget {
  final int month;
  final int year;
  final List<DateTime> eventDates;
  final List<DateTime> holidays; // List of holidays
  final List<DateTime> examDates; // List of exam dates

  const MonthCalendar({
    Key? key,
    required this.month,
    required this.year,
    required this.eventDates,
    required this.holidays,
    required this.examDates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstDayOfMonth = DateTime(year, month, 1);
    final lastDayOfMonth =
        DateTime(year, month + 1, 1).subtract(const Duration(days: 1));
    final now = DateTime.now();

    // Ensure focusedDay is within the range of the current month
    DateTime focusedDay =
        now.isAfter(firstDayOfMonth) && now.isBefore(lastDayOfMonth)
            ? now
            : DateTime(year, month, 1);
    // print("object${focusedDay}");
    // String formattedFocusedDay = DateFormat('dd MMMM').format(focusedDay);

    return SizedBox(
      width: 124,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(.30),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ), // borderRadius: BorderRadius.circular(8.0),
          child: TableCalendar(
            firstDay: firstDayOfMonth,
            lastDay: lastDayOfMonth,
            focusedDay: focusedDay,
            // focusedDay: formafocusedDayttedFocusedDay,
            calendarFormat: CalendarFormat.month,
            // selectedDayPredicate: (day) {
            //   return isSameDay(_selectedDay, day);
            // },

            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleTextFormatter: (focusedDay, _) {
                return DateFormat('MM MMMM').format(focusedDay);
              },

              // titleTextFormatter: formattedFocusedDay,
              leftChevronVisible: false,
              rightChevronVisible: false,
              formatButtonPadding: EdgeInsets.zero,
              headerMargin: const EdgeInsets.only(bottom: 1),
              headerPadding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.green.shade600,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),

              // decoration: const BoxDecoration(color: Colors.white),
              titleTextStyle: TextStyle(
                color: now.month == month ? Colors.white : Colors.white,
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(
                  fontSize: 12,
                  color: now.month == month ? Colors.white : Colors.white),
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  border: Border.all(color: Colors.black)),
              weekdayStyle: TextStyle(
                fontSize: 12,
                color: now.month == month ? Colors.white : Colors.white,
              ),
            ),

            availableCalendarFormats: const {CalendarFormat.month: 'Month'},
            rowHeight: 15,
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, date, _) {
                // Check if the current date is an event date
                bool isEventDate = eventDates.any((eventDate) =>
                    eventDate.year == date.year &&
                    eventDate.month == date.month &&
                    eventDate.day == date.day);

                // Check if the current date is a holiday (Sunday or specific holiday)
                bool isHoliday = holidays.any((holiday) =>
                    holiday.year == date.year &&
                    holiday.month == date.month &&
                    holiday.day == date.day);

                // Check if the current date is an exam date
                bool isExamDate = examDates.any((examDate) =>
                    examDate.year == date.year &&
                    examDate.month == date.month &&
                    examDate.day == date.day);

                // Check if the current date is in the fall semester
                bool isFallSemester = date.isAfter(DateTime(year, 9, 26)) &&
                    date.isBefore(DateTime(year + 1, 2, 5));

                // Check if the current date is in the spring semester
                bool isSpringSemester = date.isAfter(DateTime(year, 3, 1)) &&
                    date.isBefore(DateTime(year, 6, 15));

                // Check if the current date is in the summer semester
                bool isSummerSemester = date.isAfter(DateTime(year, 6, 30)) &&
                    date.isBefore(DateTime(year, 8, 30));

                if (isEventDate) {
                  return Container(
                    height: 17,
                    width: 20,
                    // margin:
                    //     const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  );
                } else if (isHoliday) {
                  return Container(
                    height: 17,
                    width: 15,

                    // margin:
                    //     const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      // color: Colors.green,
                      color: Colors.transparent,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  );
                } else if (isExamDate) {
                  return Container(
                    height: 17,
                    width: 20,

                    // margin:
                    //     const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                      // color: Colors.brown,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  );
                } else if (isFallSemester) {
                  return Container(
                    height: 17,
                    width: 20,

                    // margin:
                    //     const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      // color: Colors.brown,
                      color: Colors.transparent,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  );
                } else if (isSpringSemester) {
                  return Container(
                    height: 17,
                    width: 20,

                    // margin:
                    //     const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  );
                } else if (isSummerSemester) {
                  return Container(
                    height: 17,
                    width: 20,

                    // margin:
                    //     const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      // color: Colors.yellow,

                      color: Colors.transparent,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  );
                } else {
                  return Container(
                    height: 17,
                    width: 20,
                    decoration: BoxDecoration(),

                    // margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(
                          color:
                              // now.month == date.month
                              //     ?
                              Colors.black,
                          fontSize: 10
                          // : Colors.grey,
                          ),
                    ),
                  );
                }
              },
            ),
            calendarStyle: CalendarStyle(
              // markerSizeScale: 50,

              cellMargin: EdgeInsets.only(left: 5, right: 20, bottom: 1),
              // cellPadding:EdgeInsets.only(left: 20,right: 50) ,
              defaultDecoration: BoxDecoration(
                // border: Border.all(color: Colors.green),
                color: Colors.transparent,
              ),
              disabledDecoration: BoxDecoration(
                // border: Border.all(color: Colors.red),
                color: Colors.transparent,
              ),
              disabledTextStyle: TextStyle(color: Colors.transparent),
              // cellPadding:EdgeInsets.all(3) ,
              cellAlignment: Alignment.bottomCenter,
              markerMargin: EdgeInsets.zero,
              todayTextStyle: TextStyle(fontSize: 10, color: Colors.black),

              // markerSizeScale: .9,

              // cellMargin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              todayDecoration: BoxDecoration(
                color: Colors.red,
                // border: Border.all(color: Colors.black),
                // shape: BoxShape.rectangle,
              ),
            ),

            onDaySelected: (selectedDay, focusedDay) {
              // Do something when a day is selected
            },
          ),
        ),
      ),
    );
  }
}

class EventsTab extends StatefulWidget {
  const EventsTab({Key? key}) : super(key: key);

  @override
  _EventsTabState createState() => _EventsTabState();
}

class _EventsTabState extends State<EventsTab> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            TabItem(
              text: 'Upcoming Events',
              index: 0,
              isSelected: _selectedTabIndex == 0,
              onTap: () {
                setState(() {
                  _selectedTabIndex = 0;
                });
              },
            ),
            TabItem(
              text: 'Held Events',
              index: 1,
              isSelected: _selectedTabIndex == 1,
              onTap: () {
                setState(() {
                  _selectedTabIndex = 1;
                });
              },
            ),
            TabItem(
              text: 'Favourite Events',
              index: 2,
              isSelected: _selectedTabIndex == 2,
              onTap: () {
                setState(() {
                  _selectedTabIndex = 2;
                });
              },
            ),
          ],
        ),
        if (_selectedTabIndex == 0) UpcomingEvents(),
        if (_selectedTabIndex == 1) HeldEvents(),
        if (_selectedTabIndex == 2) FavoriteEvents(),
      ],
    );
  }
}

class UpcomingEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Upcoming Events Content'),
    );
  }
}

class HeldEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Held Events Content'),
    );
  }
}

class FavoriteEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Favorite Events Content'),
    );
  }
}

class EventCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('Event Calendar'), // Display event calendar content here
    );
  }
}

class MyEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Events'),
      ),
      body: Container(
        alignment: Alignment.center,
        child:
            Text('My Events Screen'), // Display my events screen content here
      ),
    );
  }
}

class AllEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Events'),
      ),
      body: Container(
        alignment: Alignment.center,
        child:
            Text('All Events Screen'), // Display all events screen content here
      ),
    );
  }
}

class ExamsScreen extends StatefulWidget {
  @override
  State<ExamsScreen> createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exams'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('Exams Screen'), // Display exams screen content here
      ),
    );
  }
}

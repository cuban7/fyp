import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class YearCalendarStd extends StatelessWidget {
  final int selectedYear;
  final List<DateTime> eventDates; // Updated to DateTime
  final List<DateTime> holidays; // List of holidays
  final List<DateTime> examDates; // List of exam dates
  Function(int) onMonthSelected; // Add this parameter

  YearCalendarStd({
    Key? key,
    required this.selectedYear,
    required this.eventDates,
    required this.holidays,
    required this.examDates, // Include examDates parameter
    required this.onMonthSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> eventList = [
      {'name': 'String 2024', 'title': 'Events'},
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
      Colors.green.shade900,
      Colors.green.shade100,
      Colors.green.shade400,
      Colors.black45,
      Colors.orange.shade200,
      Colors.purple.shade200,
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
                _buildYearCalendar(context, selectedYear, eventDates, holidays,
                    examDates, onMonthSelected), // Pass examDates here
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: eventList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final Color color = tileColors[index % tileColors.length];

              return Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: color,
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        eventList[index]['name'] ?? '',
                        style: const TextStyle(
                            fontSize: 8,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        "${eventList[index]['title']}",
                        style: const TextStyle(
                            fontSize: 8,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  static Widget _buildYearCalendar(
    BuildContext context,
    int year,
    List<DateTime> eventDates, // Updated to DateTime
    List<DateTime> holidays, // List of holidays
    List<DateTime> examDates, // List of exam dates
    Function(int) onMonthSelected,
  ) {
    List<Widget> rows = [];
    for (int month = 2; month <= 12; month += 3) {
      int nextMonth = month + 1;
      int secondMonth = nextMonth + 1;
      if (nextMonth <= 12) {
        rows.add(Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                onMonthSelected(month);
              },
              child: YearCalendarForStudentsWidgetClass(
                month: month,
                year: year,
                eventDates: eventDates,
                holidays: holidays,
                examDates: examDates,
              ),
            ),
            GestureDetector(
              onTap: () {
                onMonthSelected(nextMonth);
              },
              child: YearCalendarForStudentsWidgetClass(
                month: nextMonth,
                year: year,
                eventDates: eventDates,
                holidays: holidays,
                examDates: examDates,
              ),
            ),
            GestureDetector(
              onTap: () {
                onMonthSelected(secondMonth);
              },
              child: YearCalendarForStudentsWidgetClass(
                month: secondMonth,
                year: year,
                eventDates: eventDates,
                holidays: holidays,
                examDates: examDates,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ));
      } else {
        rows.add(YearCalendarForStudentsWidgetClass(
          month: month,
          year: year,
          eventDates: eventDates,
          holidays: holidays,
          examDates: examDates,
        ));
      }
    }
    return Column(children: rows);
  }
}

class YearCalendarForStudentsWidgetClass extends StatelessWidget {
  final int month;
  final int year;
  final List<DateTime> eventDates; // Updated to DateTime
  final List<DateTime> holidays; // List of holidays
  final List<DateTime> examDates; // List of exam dates

  YearCalendarForStudentsWidgetClass({
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
    DateTime focusedDay =
        now.isAfter(firstDayOfMonth) && now.isBefore(lastDayOfMonth)
            ? now
            : DateTime(year, month, 1);
    return SizedBox(
      width: 124,
      height: 135, // Set a fixed height for all month boxes

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
          ),
          child: GestureDetector(
            // onTap: () => _navigateToMonth(context),
            child: TableCalendar(
              firstDay: firstDayOfMonth,
              lastDay: lastDayOfMonth,
              focusedDay: focusedDay,
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleTextFormatter: (focusedDay, _) {
                  return DateFormat('MM MMMM').format(focusedDay);
                },
                leftChevronVisible: false,
                rightChevronVisible: false,
                formatButtonPadding: EdgeInsets.zero,
                headerMargin: const EdgeInsets.only(bottom: 1),
                headerPadding: const EdgeInsets.only(left: 3),
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
                titleTextStyle: TextStyle(
                  color: now.month == month ? Colors.white : Colors.white,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                dowTextFormatter: (date, locale) =>
                    DateFormat.E(locale).format(date)[0],
                weekendStyle: TextStyle(
                    fontSize: 12,
                    color: now.month == month ? Colors.white : Colors.white),
                decoration: const BoxDecoration(
                  color: Colors.lightGreen,
                ),
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
                  bool isEventDate = eventDates.contains(date);
                  // Check if the current date is a holiday (Sunday or specific holiday)
                  bool isHoliday = holidays.contains(date);

                  // Check if the current date is an exam date
                  bool isExamDate = examDates.contains(date);

                  // Check if the current date is in the fall semester
                  bool isFallSemester = date.isAfter(DateTime(year, 9, 26)) &&
                      date.isBefore(DateTime(year + 1, 2, 5));

                  // Check if the current date is in the spring semester
                  bool isSpringSemester = date.isAfter(DateTime(year, 3, 1)) &&
                      date.isBefore(DateTime(year, 6, 15));

                  // Check if the current date is in the summer semester
                  bool isSummerSemester = date.isAfter(DateTime(year, 6, 30)) &&
                      date.isBefore(DateTime(year, 8, 30));

                  return DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black.withOpacity(.5), width: .5),
                    ),
                    child: Container(
                      height: 17,
                      width: 20,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(),
                      child: Text(
                        date.day.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ),
                  );
                },
              ),
              calendarStyle: const CalendarStyle(
                cellMargin: EdgeInsets.only(left: 5, right: 20, bottom: 1),
                defaultDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                disabledDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                disabledTextStyle: TextStyle(color: Colors.transparent),
                cellAlignment: Alignment.bottomCenter,
                markerMargin: EdgeInsets.zero,
                todayTextStyle: TextStyle(fontSize: 10, color: Colors.black),
                todayDecoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
              onDaySelected: (selectedDay, focusedDay) {
                // Do something when a day is selected
              },
              onHeaderTapped: (focusedDay) {
                // print("kinza");
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => MonthScreen(
                //       month: month,
                //       eventDates: eventDates,
                //       examDates: examDates,
                //       holidays: holidays,
                //       year: year,
                //     ),
                //   ),
                // );
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fyp_academic_calendar/Teacher/teacherDashboard.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class SemesterCalendarStudent extends StatefulWidget {
  final int selectedYear;
  final List<DateTime> eventDates; // Updated to DateTime
  final List<DateTime> holidays; // List of holidays
  final List<DateTime> examDates; // List of exam dates

  const SemesterCalendarStudent({
    Key? key,
    required this.selectedYear,
    required this.eventDates,
    required this.holidays,
    required this.examDates, // Include examDates parameter
  }) : super(key: key);

  @override
  _YearCalendarStdState createState() => _YearCalendarStdState();
}

class _YearCalendarStdState extends State<SemesterCalendarStudent> {
  String _selectedSemester = 'Fall'; // Default selected semester

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropdownButton<String>(
              padding: EdgeInsets.zero,
              elevation: 2,
              value: _selectedSemester,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSemester = newValue!;
                });
              },
              items: <String>['Spring', 'Summer', 'Fall']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              width: 30,
            )
          ],
        ),
        // Calendar display based on selected semester
        _buildSemesterCalendar(
          context,
          widget.selectedYear,
          _selectedSemester,
          widget.holidays,
          widget.eventDates,
        ),
        // Additional widgets if needed
      ],
    );
  }

  Widget _buildSemesterCalendar(
    BuildContext context,
    int year,
    String semester,
    holidays,
    eventDates,
  ) {
    switch (semester) {
      case 'Spring':
        return _buildSpringCalendar(context, widget.selectedYear, eventDates,
            holidays, widget.examDates); // Pass examDates here
      case 'Summer':
        return _buildSummerCalendar(context, widget.selectedYear, eventDates,
            holidays, widget.examDates); // Pass examDates here
      case 'Fall':
        return _buildFallCalendar(context, widget.selectedYear, eventDates,
            holidays, widget.examDates); // Pass examDates here
      default:
        return Container(); // Handle default case if needed
    }
  }

  // Calendar for Spring semester
  static Widget _buildSpringCalendar(
    BuildContext context,
    int year,
    List<DateTime> eventDates, // Updated to DateTime
    List<DateTime> holidays, // List of holidays
    List<DateTime> examDates, // List of exam dates
  ) {
    List<Widget> rows = [];
    for (int month = 2; month <= 6; month += 3) {
      int nextMonth = month + 1;
      int secondMonth = nextMonth + 1;
      if (nextMonth <= 12) {
        rows.add(Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            SemesterCalendarForStudentsWidgetClass(
              month: month,
              year: year,
              eventDates: eventDates,
              holidays: holidays,
              examDates: examDates,
            ),
            SemesterCalendarForStudentsWidgetClass(
              month: nextMonth,
              year: year,
              eventDates: eventDates,
              holidays: holidays,
              examDates: examDates,
            ),
            SemesterCalendarForStudentsWidgetClass(
              month: secondMonth,
              year: year,
              eventDates: eventDates,
              holidays: holidays,
              examDates: examDates,
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ));
      } else {
        rows.add(SemesterCalendarForStudentsWidgetClass(
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

  static Widget _buildSummerCalendar(
    BuildContext context,
    int year,
    List<DateTime> eventDates, // Updated to DateTime
    List<DateTime> holidays, // List of holidays
    List<DateTime> examDates, // List of exam dates
  ) {
    List<Widget> rows = [];
    for (int month = 7; month <= 9; month += 3) {
      int nextMonth = month + 1;
      int secondMonth = nextMonth + 1;
      if (nextMonth <= 12) {
        rows.add(Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            SemesterCalendarForStudentsWidgetClass(
              month: month,
              year: year,
              eventDates: eventDates,
              holidays: holidays,
              examDates: examDates,
            ),
            SemesterCalendarForStudentsWidgetClass(
              month: nextMonth,
              year: year,
              eventDates: eventDates,
              holidays: holidays,
              examDates: examDates,
            ),
            SemesterCalendarForStudentsWidgetClass(
              month: secondMonth,
              year: year,
              eventDates: eventDates,
              holidays: holidays,
              examDates: examDates,
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ));
      } else {
        rows.add(SemesterCalendarForStudentsWidgetClass(
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

  static Widget _buildFallCalendar(
    BuildContext context,
    int year,
    List<DateTime> eventDates, // Updated to DateTime
    List<DateTime> holidays, // List of holidays
    List<DateTime> examDates, // List of exam dates
  ) {
    List<Widget> rows = [];
    for (int month = 9; month <= 12; month += 3) {
      int nextMonth = month + 1;
      int secondMonth = nextMonth + 1;
      int nextYear = year; // Initialize nextYear to current year
      if (nextMonth > 12) {
        nextMonth -= 12; // Adjust nextMonth to stay within 1-12 range
        nextYear++; // Increment nextYear if nextMonth is greater than 12
      }
      rows.add(
        Row(
          children: [
            const SizedBox(width: 5),
            SemesterCalendarForStudentsWidgetClass(
              month: month,
              year: year,
              eventDates: eventDates,
              holidays: holidays,
              examDates: examDates,
            ),
            SemesterCalendarForStudentsWidgetClass(
              month: nextMonth,
              year: nextYear,
              eventDates: eventDates,
              holidays: holidays,
              examDates: examDates,
            ),
            SemesterCalendarForStudentsWidgetClass(
              month: secondMonth,
              year: nextYear,
              eventDates: eventDates,
              holidays: holidays,
              examDates: examDates,
            ),
            const SizedBox(width: 5),
          ],
        ),
      );
    }
    return Column(children: rows);
  }
}

class SemesterCalendarForStudentsWidgetClass extends StatelessWidget {
  final int month;
  final int year;
  final List<DateTime> eventDates; // Updated to DateTime
  final List<DateTime> holidays; // List of holidays
  final List<DateTime> examDates; // List of exam dates

  SemesterCalendarForStudentsWidgetClass({
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
      width: 115,
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

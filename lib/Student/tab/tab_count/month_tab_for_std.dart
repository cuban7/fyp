import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthTabStd extends StatelessWidget {
  final int selectedYear;
  final List<DateTime> eventDates; // Updated to DateTime
  final List<DateTime> holidays; // List of holidays
  final List<DateTime> examDates; // List of exam dates
  final int selectedMonth;

  const MonthTabStd({
    Key? key,
    required this.selectedYear,
    required this.eventDates,
    required this.holidays,
    required this.examDates,
    required this.selectedMonth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a scroll controller
    final ScrollController _scrollController = ScrollController();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController, // Assign scroll controller
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            // March to December of 2024
            for (int month = 2; month <= 12; month++)
              MonthCalendarForStudentsTwo(
                month: month,
                year: selectedYear,
                eventDates: eventDates,
                holidays: holidays,
                examDates: examDates,
                selectedMonth: selectedMonth,
                scrollController: _scrollController, // Pass scroll controller
              ),
            // January and February of 2025
            MonthCalendarForStudentsTwo(
              month: 1,
              year: selectedYear + 1, // January of the next year
              eventDates: eventDates,
              holidays: holidays,
              examDates: examDates,
              selectedMonth: selectedMonth,
              scrollController: _scrollController, // Pass scroll controller
            ),
            MonthCalendarForStudentsTwo(
              month: 2,
              year: selectedYear + 1, // February of the next year
              eventDates: eventDates,
              holidays: holidays,
              examDates: examDates,
              selectedMonth: selectedMonth,
              scrollController: _scrollController, // Pass scroll controller
            ),
          ],
        ),
      ),
    );
  }
}

class MonthCalendarForStudentsTwo extends StatelessWidget {
  final int month;
  final int year;
  final List<DateTime> eventDates; // Updated to DateTime
  final List<DateTime> holidays; // List of holidays
  final List<DateTime> examDates; // List of exam dates
  final int selectedMonth;
  final ScrollController scrollController;

  const MonthCalendarForStudentsTwo({
    Key? key,
    required this.month,
    required this.year,
    required this.eventDates,
    required this.holidays,
    required this.examDates,
    required this.selectedMonth,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("kinza${selectedMonth}");
    final firstDayOfMonth = DateTime(year, month, 1);
    final lastDayOfMonth =
        DateTime(year, month + 1, 1).subtract(const Duration(days: 1));
    final now = DateTime.now();
    DateTime focusedDay =
        now.isAfter(firstDayOfMonth) && now.isBefore(lastDayOfMonth)
            ? now
            : DateTime(year, month, 1);
    double position = (selectedMonth - 1) * 220.0;

    // Scroll to the position of the selected month by default
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
    if (selectedMonth == 2) {
      double position = (selectedMonth) * 0.0;
      print("position....${position}");
      // Scroll to the position of the tapped month
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else if (selectedMonth == 3) {
      double position = (selectedMonth) * 100.0;
      print("position....${position}");
      // Scroll to the position of the tapped month
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else if (selectedMonth == 4) {
      double position = (selectedMonth) * 150.0;
      print("position....${position}");
      // Scroll to the position of the tapped month
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else if (selectedMonth == 5) {
      double position = (selectedMonth) * 180.0;
      print("position....${position}");
      // Scroll to the position of the tapped month
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else if (selectedMonth == 6) {
      double position = (selectedMonth) * 200.0;
      print("position....${position}");
      // Scroll to the position of the tapped month
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else if (selectedMonth == 7) {
      double position = (selectedMonth) * 212.0;
      print("position....${position}");
      // Scroll to the position of the tapped month
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else if (selectedMonth == 8) {
      double position = (selectedMonth) * 222.0;
      print("position....${position}");
      // Scroll to the position of the tapped month
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else if (selectedMonth == 9) {
      double position = (selectedMonth) * 230.0;
      print("position....${position}");
      // Scroll to the position of the tapped month
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else if (selectedMonth == 10) {
      double position = (selectedMonth) * 240.0;
      print("position....${position}");
      // Scroll to the position of the tapped month
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else if (selectedMonth == 11) {
      double position = (selectedMonth) * 245.0;
      print("position....${position}");
      // Scroll to the position of the tapped month
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else if (selectedMonth == 12) {
      double position = (selectedMonth) * 250.0;
      print("position....${position}");
      // Scroll to the position of the tapped month
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    } else if (selectedMonth == 13) {
      double position = (selectedMonth) * 253.0;
      print("position....${position}");
      // Scroll to the position of the tapped month'
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }

    return GestureDetector(
      child: SizedBox(
        width: 300,
        height: 194, // Set a fixed height for all month boxes

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
                        color:
                            now.month == month ? Colors.white : Colors.white),
                    decoration: const BoxDecoration(
                      color: Colors.lightGreen,
                    ),
                    weekdayStyle: TextStyle(
                      fontSize: 12,
                      color: now.month == month ? Colors.white : Colors.white,
                    ),
                  ),
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month'
                  },
                  rowHeight: 25,
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, date, _) {
                      // Check if the current date is an event date
                      bool isEventDate = eventDates.contains(date);
                      // Check if the current date is a holiday (Sunday or specific holiday)
                      bool isHoliday = holidays.contains(date);

                      // Check if the current date is an exam date
                      bool isExamDate = examDates.contains(date);

                      // Check if the current date is in the fall semester
                      bool isFallSemester =
                          date.isAfter(DateTime(year, 9, 26)) &&
                              date.isBefore(DateTime(year + 1, 2, 5));

                      // Check if the current date is in the spring semester
                      bool isSpringSemester =
                          date.isAfter(DateTime(year, 3, 1)) &&
                              date.isBefore(DateTime(year, 6, 15));

                      // Check if the current date is in the summer semester
                      bool isSummerSemester =
                          date.isAfter(DateTime(year, 6, 30)) &&
                              date.isBefore(DateTime(year, 8, 30));

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black.withOpacity(.5), width: .5),
                        ),
                        child: Container(
                          // height: 17,
                          // width: 20,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              // color: isEventDate ? Colors.blue : // color for event date
                              // isHoliday ? Colors.red : // color for holiday
                              // isExamDate ? Colors.green : // color for exam date
                              // isFallSemester ? Colors.orange : // color for fall semester
                              // isSpringSemester ? Colors.purple : // color for spring semester
                              // isSummerSemester ? Colors.yellow : // color for summer semester
                              // Colors.transparent, // default color
                              ),
                          child: Text(
                            date.day.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          ),
                        ),
                      );
                    },
                  ),
                  calendarStyle: CalendarStyle(
                    cellMargin:
                        const EdgeInsets.only(left: 5, right: 20, bottom: 1),
                    defaultDecoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    disabledDecoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    disabledTextStyle:
                        const TextStyle(color: Colors.transparent),
                    cellAlignment: Alignment.bottomCenter,
                    markerMargin: EdgeInsets.zero,
                    todayTextStyle:
                        const TextStyle(fontSize: 10, color: Colors.black),
                    todayDecoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black.withOpacity(.5), width: .5),
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
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

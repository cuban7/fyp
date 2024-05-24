import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthTabStd extends StatelessWidget {
  final int selectedYear;
  final List<DateTime> eventDates;
  final List<DateTime> holidays;
  final List<DateTime> examDates;
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
    final ScrollController _scrollController = ScrollController();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            for (int month = 9; month <= 12; month++)
              MonthCalendarForStudentsTwo(
                month: month,
                year: selectedYear,
                eventDates: eventDates,
                holidays: holidays,
                examDates: examDates,
                selectedMonth: selectedMonth,
                scrollController: _scrollController,
              ),
            for (int month = 1; month <= 8; month++)
              MonthCalendarForStudentsTwo(
                month: month,
                year: selectedYear + 1,
                eventDates: eventDates,
                holidays: holidays,
                examDates: examDates,
                selectedMonth: selectedMonth,
                scrollController: _scrollController,
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
  final List<DateTime> eventDates;
  final List<DateTime> holidays;
  final List<DateTime> examDates;
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
    final firstDayOfMonth = DateTime(year, month, 1);
    final lastDayOfMonth =
        DateTime(year, month + 1, 1).subtract(const Duration(days: 1));
    final now = DateTime.now();
    DateTime focusedDay =
        now.isAfter(firstDayOfMonth) && now.isBefore(lastDayOfMonth)
            ? now
            : DateTime(year, month, 1);
    double position = (selectedMonth - 1) * MediaQuery.of(context).size.width;

    // Scroll to the position of the selected month by default
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });

    return GestureDetector(
      child: SizedBox(
        width: MediaQuery.of(context).size.width, // Set width to screen width
        height:
            MediaQuery.of(context).size.height * 0.8, // Adjust height as needed
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
                    return DateFormat('MMMM yyyy').format(focusedDay);
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
                    color: Colors.white,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  dowTextFormatter: (date, locale) =>
                      DateFormat.E(locale).format(date)[0],
                  weekendStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.lightGreen,
                  ),
                  weekdayStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                availableCalendarFormats: const {CalendarFormat.month: 'Month'},
                rowHeight: 40,
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, date, _) {
                    // Check if the current date is an event date
                    bool isEventDate = eventDates.contains(date);
                    // Check if the current date is a holiday
                    bool isHoliday = holidays.contains(date);
                    // Check if the current date is an exam date
                    bool isExamDate = examDates.contains(date);

                    return DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black.withOpacity(.5),
                          width: .5,
                        ),
                        color: isEventDate
                            ? Colors.blue
                            : isHoliday
                                ? Colors.red
                                : isExamDate
                                    ? Colors.green
                                    : Colors.transparent,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          date.day.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
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
                  disabledTextStyle: const TextStyle(color: Colors.transparent),
                  cellAlignment: Alignment.bottomCenter,
                  markerMargin: EdgeInsets.zero,
                  todayTextStyle:
                      const TextStyle(fontSize: 16, color: Colors.black),
                  todayDecoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black.withOpacity(.5), width: .5),
                  ),
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  // Do something when a day is selected
                },
                onHeaderTapped: (focusedDay) {
                  // Do something when header is tapped
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

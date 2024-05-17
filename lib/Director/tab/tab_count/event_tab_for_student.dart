import 'package:flutter/material.dart';

class EventTabForStudent extends StatefulWidget {
  const EventTabForStudent({Key? key}) : super(key: key);

  @override
  _EventsTabState createState() => _EventsTabState();
}

class _EventsTabState extends State<EventTabForStudent> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedTabIndex = 0;
                });
              },
              child: Text(
                'Upcoming Events',
                style: TextStyle(
                  color: _selectedTabIndex == 0 ? Colors.green[900] : Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedTabIndex = 1;
                });
              },
              child: Text(
                'Held Events',
                style: TextStyle(
                  color: _selectedTabIndex == 1 ? Colors.green[900] : Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedTabIndex = 2;
                });
              },
              child: Text(
                'Favorite Events',
                style: TextStyle(
                  color: _selectedTabIndex == 2 ? Colors.green[900] : Colors.black,
                ),
              ),
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
  const UpcomingEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Upcoming Events Content');
  }
}
class HeldEvents extends StatelessWidget {
  const HeldEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Held Events Content');
  }
}
class FavoriteEvents extends StatelessWidget {
  const FavoriteEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Favourite Events Content');
  }
}
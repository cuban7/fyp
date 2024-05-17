// import 'package:flutter/material.dart';
// import 'package:fyp_academic_calendar/DataCell/addStudentTT.dart';
// import 'package:fyp_academic_calendar/DataCell/addTeachersTT.dart';
// import 'package:fyp_academic_calendar/DataCell/notifications.dart';
// import 'package:fyp_academic_calendar/DataCell/AddDatesheet.dart';
// import 'package:fyp_academic_calendar/DataCell/AddSittingPlan.dart';
// import 'package:fyp_academic_calendar/DataCell/schedule.dart';
// import 'package:fyp_academic_calendar/loginscreen.dart';

// class SocietyScreen extends StatefulWidget {
//   const SocietyScreen({Key? key}) : super(key: key);

//   @override
//   _SocietyScreenState createState() => _SocietyScreenState();
// }

// class _SocietyScreenState extends State<SocietyScreen> {
//   List<String> societyNames = [
//     'Adventure Society',
//     'Cultural Society',
//     'Cyber Security Society',
//     'Sports Society',
//     // Add more society names as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Society Screen'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications),
//             onPressed: () {
//               // Navigate to the notification screen
//               Example:
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const NotificationScreen()));
//             },
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(padding: EdgeInsets.zero, children: [
//           const DrawerHeader(
//             decoration: BoxDecoration(color: Colors.teal),
//             child: Text('Drawer'),
//           ),
//           ListTile(
//             title: const Text('Add Datesheet'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AddDatesheet()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Add Sitting Plan'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => addSittingplan()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Add Teachers Timetable'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => addTeachersTT()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Add Student Timetable'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => addStudentsTT()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Schedule'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Schedule()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Society'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SocietyScreen()),
//               );
//             },
//           ),
//           const Divider(),
//           ListTile(
//             title: const Text('Logout'),
//             leading: const Icon(Icons.logout),
//             onTap: () {
//               // Add your logout logic here
//               // For example, you can navigate to the login screen
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginScreen()),
//               );
//             },
//           ),
//         ]),
//       ),
//       body: ListView.builder(
//         itemCount: societyNames.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(societyNames[index]),
//             // You can add more details or actions related to each society here
//             // For example, onTap to navigate to a specific society's details screen
//             onTap: () {
//               // Add navigation logic here
//             },
//           );
//         },
//       ),
//     );
//   }
// }

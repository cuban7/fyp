// import 'package:flutter/material.dart';
// import 'package:fyp_academic_calendar/DataCell/notifications.dart';
// import 'package:fyp_academic_calendar/SystemAdmin/adduser.dart';
// import 'package:fyp_academic_calendar/SystemAdmin/noti.dart';
// import 'package:fyp_academic_calendar/SystemAdmin/saDashboard.dart';


// import 'package:fyp_academic_calendar/loginscreen.dart';

// class ColorCodeScreen extends StatelessWidget {
//   const ColorCodeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             Text('System Admin Dashboard',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//             Text('BIIT Academic Calendar', style: TextStyle(fontSize: 18)),
//             Text('2023',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications),
//             onPressed: () {
//               // Add notification logic here
//               Example:
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>  SystemAdminNotification()));
//             },
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(padding: EdgeInsets.zero, children: [
//           const DrawerHeader(
//             decoration: BoxDecoration(color: Colors.teal),
//             child: Text('System Admin'),
//           ),
//           ListTile(
//             title: const Text('Add User'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AddUser()),
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
//                 MaterialPageRoute(builder: (context) => const LoginScreen()),
//               );
//             },
//           ),
//         ]),
//       ),
//       body: ListView(
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Center(
//               child: Text(
//                 'Color Code',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           ColorEventItem(
//             color: Colors.green.shade100,
//             eventName: 'Events',
//           ),
//           ColorEventItem(
//             color: Colors.purple.shade100,
//             eventName: 'Public Holiday',
//           ),
//           ColorEventItem(
//             color: Colors.blue.shade100,
//             eventName: 'Exams and Semester start Indication',
//           ),
//           ColorEventItem(
//             color: Colors.yellow.shade100,
//             eventName: 'Fall Sementer',
//           ),
//           ColorEventItem(
//             color: Colors.orange.shade100,
//             eventName: 'Spring Semester',
//           ),
//           const ColorEventItem(
//             color: Colors.yellow,
//             eventName: 'Summer Semester',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ColorEventItem extends StatelessWidget {
//   final Color color;
//   final String eventName;

//   const ColorEventItem({
//     Key? key,
//     required this.color,
//     required this.eventName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       child: Row(
//         children: [
//           Container(
//             width: 20,
//             height: 20,
//             color: color,
//           ),
//           const SizedBox(width: 8),
//           Text(
//             eventName,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

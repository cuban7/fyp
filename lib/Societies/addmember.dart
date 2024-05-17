// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:fyp_academic_calendar/Societies/addrole.dart';
// import 'package:fyp_academic_calendar/Societies/addupdate_event.dart';
// import 'package:fyp_academic_calendar/Societies/advNoti.dart';
// import 'package:fyp_academic_calendar/Societies/studentAffair.dart';
// import 'package:fyp_academic_calendar/loginscreen.dart';
// import 'package:http/http.dart' as http;

// class addmember extends StatefulWidget {
//   @override
//   State<addmember> createState() => _addupdateEventState();
// }

// class _addupdateEventState extends State<addmember> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _degreeController = TextEditingController();
//   final TextEditingController _semController = TextEditingController();
//   String Selected_aridno = '';
//   List<String> _roles = [];
//   List<String> _filteredaridno = [];

//   void initState() {
//     super.initState();
//     fetchAridno();
//   }

//   Future<void> fetchAridno() async {
//     final response = await http.get(
//         Uri.parse('http://192.168.1.154/fyp_1/api/Society/StudentAridno'));

//     if (response.statusCode == 200) {
//       Map<String, dynamic> responseData = json.decode(response.body);
//       // print(responseData);
//       //  //decode= data from database to frontend
//       //   setState(() {
//       //   _roles.add(
//       //         responseData['ARIDNo'].toString()); //tostring=for managing datatypes
//       //     // _nameController.text = responseData['Name'].toString();
//       //     // _DisciplineController.text = responseData['Discipline'].toString();
//       //     // _semesterController.text = responseData['Semester'] != null
//       //     //     ? responseData['Semester'].toString()
//       //     //     : "N/A";
//       //   //  print(_aridnoController);
//       List<dynamic> aridNoList = responseData['ARIDNo'];
//       setState(() {
//         // Clear existing roles and add new ones
//         _roles.clear();
//         _roles.addAll(aridNoList.map((e) => e.toString())); // Convert to string
//       });

//       print(_roles);
//     } else {
//       throw Exception('Failed to load profile data');
//     }
//   }

//   @override
//   void dispose() {
//     // _aridnoController.dispose();
//     _nameController.dispose();
//     _degreeController.dispose();
//     _semController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Societies Dashboard'),
//         actions: [
//           IconButton(
//             icon: const Icon(
//               Icons.notifications,
//               color: Colors.yellow,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SocietyNotification()),
//               );
//             },
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(padding: EdgeInsets.zero, children: [
//           const DrawerHeader(
//             decoration: BoxDecoration(color: Colors.teal),
//             child: Text('Societies Dashboard'),
//           ),
//           ListTile(
//             title: const Text('Add/Update Event'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => addupdateEvent()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Add Role'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => addrole()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Add Member'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => addmember()),
//               );
//             },
//           ),
//           ListTile(
//             title: const Text('Student Affair'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => stdAffair()),
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
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             Stack(
//               alignment: AlignmentDirectional.centerStart,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const CircleAvatar(
//                       backgroundImage: AssetImage('assets/download.jpg'),
//                       radius: 50,
//                     ),
//                     const SizedBox(width: 20),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(height: 10),
//                         Text('BIIT Academic Calendar',
//                             style: TextStyle(fontSize: 18)),
//                         Text('2023-2024',
//                             style: TextStyle(
//                                 fontSize: 14, fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Stack(
//               alignment: AlignmentDirectional.centerStart,
//               children: [
//                 Text(
//                   'Add Member',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             _SEARCHField('Arid No'),
//             _buildTextField("Name", _nameController),
//             _buildTextField("Degree", _degreeController),
//             _buildTextField("Semester", _semController),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Add your button functionality here
//               },
//               child:
//                   const Text('Submit', style: TextStyle(color: Colors.white)),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.green.shade900,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30)),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> filteredArid(String aridno) async {
//     try {
//       final response = await http.get(Uri.parse(
//           'http://192.168.1.154//fyp_1/api/Society/StudentAridno?ARIDNo=${aridno}'));

//       if (response.statusCode == 200) {
//         print('Student filtered ${response.body}');

//         setState(() {
//           var student = json.decode(response.body);
//         });
//       } else {
//         throw Exception('Failed to load seating plan');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Widget _buildTextField(String label, TextEditingController controller,
//       {bool hasSearchButton = false}) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               style: const TextStyle(
//                   color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: TextField(
//               controller: controller,
//               style: const TextStyle(color: Colors.black),
//               enabled: false,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//           // if (hasSearchButton && label == "Arid No:")
//           //   SizedBox(
//           //     width: 80,
//           //     height: 40,
//           //     child: ElevatedButton(
//           //       onPressed: () {
//           //         // Add your search functionality here
//           //       },
//           //       child: Text('Search', style: TextStyle(color: Colors.white)),
//           //       style: ElevatedButton.styleFrom(
//           //         primary: Colors.green.shade900,
//           //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//           //         padding: EdgeInsets.zero,
//           //       ),),)
//         ],
//       ),
//     );
//   }

//   Widget _SEARCHField(String label) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 100,
//             child: Row(
//               children: [
//                 Text(
//                   label,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: TextFormField(
//               readOnly: false, // Make the TextFormField editable
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 suffixIcon: GestureDetector(
//                   onTap: ()async {
//                    await filteredArid(label);
//                     // Add your search functionality here
//                     print('Search clicked');
//                   },
//                   child: Icon(Icons.search),
//                 ),
//                 // Add more decoration properties if needed
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp_academic_calendar/Societies/addrole.dart';
import 'package:fyp_academic_calendar/Societies/addupdate_event.dart';
import 'package:fyp_academic_calendar/Societies/advNoti.dart';
import 'package:fyp_academic_calendar/Societies/studentAffair.dart';
import 'package:fyp_academic_calendar/loginscreen.dart';
import 'package:http/http.dart' as http;

class addmember extends StatefulWidget {
  @override
  State<addmember> createState() => _addupdateEventState();
}

class _addupdateEventState extends State<addmember> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _semController = TextEditingController();
  String Selected_aridno = '';
  List<String> _roles = [];
  List<String> _filteredaridno = [];

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _aridnoController.dispose();
    _nameController.dispose();
    _degreeController.dispose();
    _semController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Societies Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.yellow,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SocietyNotification()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text('Societies Dashboard'),
          ),
          ListTile(
            title: const Text('Add/Update Event'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addupdateEvent()),
              );
            },
          ),
          ListTile(
            title: const Text('Add Role'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addrole()),
              );
            },
          ),
          ListTile(
            title: const Text('Add Member'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addmember()),
              );
            },
          ),
          ListTile(
            title: const Text('Student Affair'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => stdAffair()),
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
            const SizedBox(height: 20),
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/download.jpg'),
                      radius: 50,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text('BIIT Academic Calendar',
                            style: TextStyle(fontSize: 18)),
                        Text('2023-2024',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Text(
                  'Add Member',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _SEARCHField('Arid No'),
            _buildTextField("Name", _nameController),
            _buildTextField("Degree", _degreeController),
            _buildTextField("Semester", _semController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your button functionality here
              },
              child:
                  const Text('Submit', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade900,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool hasSearchButton = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black),
              enabled: false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // if (hasSearchButton && label == "Arid No:")
          //   SizedBox(
          //     width: 80,
          //     height: 40,
          //     child: ElevatedButton(
          //       onPressed: () {
          //         // Add your search functionality here
          //       },
          //       child: Text('Search', style: TextStyle(color: Colors.white)),
          //       style: ElevatedButton.styleFrom(
          //         primary: Colors.green.shade900,
          //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          //         padding: EdgeInsets.zero,
          //       ),),)
        ],
      ),
    );
  }

  Widget _SEARCHField(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: TextFormField(
          //     onChanged: (value) async {
          //       // Call a function to check if the ARID No exists in the database
          //       bool isValidUser = await checkARIDNoValidity(value);
          //       if (isValidUser) {
          //         // If the ARID No is valid, fetch and display user data
          //         fetchUserData(value);
          //       } else {
          //         // If the ARID No is invalid, show a popup
          //         showDialog(
          //           context: context,
          //           builder: (BuildContext context) {
          //             return AlertDialog(
          //               title: Text("Invalid User"),
          //               content: Text("The entered ARID No is invalid."),
          //               actions: <Widget>[
          //                 TextButton(
          //                   onPressed: () {
          //                     Navigator.of(context).pop();
          //                   },
          //                   child: Text("OK"),
          //                 ),
          //               ],
          //             );
          //           },
          //         );
          //       }
          //     },
          //     readOnly: false, // Make the TextFormField editable
          //     decoration: InputDecoration(
          //       filled: true,
          //       fillColor: Colors.grey[200],
          //       suffixIcon: GestureDetector(
          //         onTap: () async {
          //           // Add your search functionality here
          //           print('Search clicked');
          //         },
          //         child: Icon(Icons.search),
          //       ),
          //       // Add more decoration properties if needed
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

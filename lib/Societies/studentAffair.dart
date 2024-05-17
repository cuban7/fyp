import 'package:flutter/material.dart';
import 'package:fyp_academic_calendar/Societies/addmember.dart';
import 'package:fyp_academic_calendar/Societies/addupdate_event.dart';
import 'package:fyp_academic_calendar/Societies/advNoti.dart';
import 'package:fyp_academic_calendar/Societies/addrole.dart';
import 'package:fyp_academic_calendar/loginscreen.dart';

class stdAffair extends StatefulWidget {
  @override
  State<stdAffair> createState() => _stdAffairState();
}

class _stdAffairState extends State<stdAffair> {
  final TextEditingController _societyController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();

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
            title: const Text('Student Affair'),
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
                  'Student Affair',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildTextField("Society", _societyController),
            _buildTextField("Title", _titleController),
            _buildTextField("Time", _timeController),
            _buildTextField("Date", _dateController),
            _buildLocationCheckboxes(),
            _buildTextField("Remarks", _remarksController, isMultiline: true),
            const SizedBox(height: 20),
            _buildActionButtons(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isMultiline = false}) {
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
              enabled: true,
              maxLines: isMultiline
                  ? null
                  : 1, // Allow multiple lines if isMultiline is true
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
        ],
      ),
    );
  }

  Widget _buildLocationCheckboxes() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              'Location:',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle checkbox click for Location 1
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      Icons.check,
                      size: 18,
                      color: Colors.black, // Set transparent initially
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle checkbox click for Location 2
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      Icons.check,
                      size: 18,
                      color: Colors.black, // Set transparent initially
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle checkbox click for Location 3
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      Icons.check,
                      size: 18,
                      color: Colors.black, // Set transparent initially
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              // Handle Accept button press
            },
            child: const Text('Accept', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: Colors.green.shade900,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle Reject button press
            },
            child: const Text('Reject', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: Colors.red.shade900,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }
}

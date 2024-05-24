import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp_academic_calendar/SystemAdmin/noti.dart';
import 'package:fyp_academic_calendar/loginscreen.dart';
import 'package:http/http.dart' as http;

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _selectedRole;
  List<String> _roles = [
    'Student',
    'Teacher',
    'Director',
    'Societies',
    'Datacell'
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'System Admin Dashboard',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.yellow,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SystemAdminNotification()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text('System Admin'),
          ),
          ListTile(
            title: const Text('Add User'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddUser()),
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
                        Text('2023',
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
                  'Add User',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildTextField("Name", _nameController),
            _buildDropdownField("Role"),
            _buildTextField("Password", _passwordController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addUser();
              },
              child: const Text('Submit',
                  style: TextStyle(
                      color: Colors.white)), // Set text color to white
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              enabled: true, // Make the field non-editable
              style: const TextStyle(color: Colors.black),
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

  Widget _buildDropdownField(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: _selectedRole,
              items: _roles.map((role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRole = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                // enabledBorder: OutlineInputBorder(
                //   borderSide: const BorderSide(color: Colors.grey),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: const BorderSide(color: Colors.blue),
                //   borderRadius: BorderRadius.circular(10),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addUser() async {
    String name = _nameController.text;
    String role = _selectedRole ?? "";
    String password = _passwordController.text;

    var userData = {'Username': name, 'Roles': role, 'Password': password};

    var jsonData = jsonEncode(userData);

    var url = Uri.parse('http://192.168.0.119/fyp_1/api/SystemAdmin/AddUser');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );

    if (response.statusCode == 200) {
      // Show a snackbar message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User added'),
          duration: Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
    } else {
      print('Failed to add user. Error: ${response.body}');
    }
  }
}

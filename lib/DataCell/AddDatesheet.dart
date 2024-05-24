import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fyp_academic_calendar/DataCell/addTT.dart';
import 'package:http/http.dart' as http;
import 'package:fyp_academic_calendar/DataCell/AddDatesheet.dart';
import 'package:fyp_academic_calendar/DataCell/AddSittingPlan.dart';
import 'package:fyp_academic_calendar/DataCell/addDutysheet.dart';
import 'package:fyp_academic_calendar/DataCell/notifications.dart';
import 'package:fyp_academic_calendar/loginscreen.dart';

class AddDatesheet extends StatefulWidget {
  @override
  _addStudentsTTState createState() => _addStudentsTTState();
}

class _addStudentsTTState extends State<AddDatesheet> {
  final TextEditingController _titleController = TextEditingController();
  String? _fileName;
  PlatformFile? _pickedFile;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
        _pickedFile = result.files.single;
      });
    }
  }

  Future<void> _submitForm() async {
    if (_pickedFile == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No file selected!")));
      return;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("File uploading...")));
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.0.119/fyp_1/api/DataCell/UploadTimetable'),
    );

    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        _pickedFile!.bytes!,
        filename: _pickedFile!.name,
      ),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("File successfully uploaded!")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("File upload failed!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text('Datacell'),
            ),
            ListTile(
              title: const Text('Add DateSheet'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddDatesheet()),
                );
              },
            ),
            // ListTile(
            //   title: const Text('Add Seating Plan'),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => addSittingplan()),
            //     );
            //   },
            // ),
            ListTile(
              title: const Text('Add Timetable'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => addTT()),
                );
              },
            ),
            // ListTile(
            //   title: const Text('Add Duty Sheet'),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => addDutysheet()),
            //     );
            //   },
            // ),
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
          ],
        ),
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
                        Text('DataCell Dashboard',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
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
            const SizedBox(height: 20),
            const Text(
              "Add Datesheet",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField("Title", _titleController),
            _buildFileUploadField("Timetable"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
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

  Widget _buildFileUploadField(String label) {
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
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  controller: TextEditingController(text: _fileName),
                  style: const TextStyle(color: Colors.black),
                  readOnly: true,
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
                IconButton(
                  onPressed: _pickFile,
                  icon: const Icon(Icons.upload_file),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

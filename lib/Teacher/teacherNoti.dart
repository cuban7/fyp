import 'package:flutter/material.dart';

class TeacherNoti extends StatefulWidget {
  const TeacherNoti({Key? key}) : super(key: key);

 

  @override
  State<TeacherNoti> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TeacherNoti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(title: const Text("Notification"),),
    );
  }
}
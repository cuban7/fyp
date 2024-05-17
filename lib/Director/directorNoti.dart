import 'package:flutter/material.dart';

class DirectorNoti extends StatefulWidget {
  const DirectorNoti({Key? key}) : super(key: key);

 

  @override
  State<DirectorNoti> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DirectorNoti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(title: const Text("Notification"),),
    );
  }
}
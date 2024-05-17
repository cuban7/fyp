import 'package:flutter/material.dart';

class stdNoti extends StatefulWidget {
  const stdNoti({Key? key}) : super(key: key);

 

  @override
  State<stdNoti> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<stdNoti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(title: const Text("Notification"),),
    );
  }
}
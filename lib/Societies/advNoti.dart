import 'package:flutter/material.dart';

class SocietyNotification extends StatelessWidget {
  const SocietyNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text('Your Notifications Content Goes Here'),
      ),
    );
  }
}
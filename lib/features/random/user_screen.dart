import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  static const String routeName = '/user';
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: Center(
        child: Text('User Screen'),
      ),
    );
  }
}

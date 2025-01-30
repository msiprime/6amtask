import 'package:flutter/material.dart';

class MyOrderScreen extends StatelessWidget {
  static const String routeName = '/my_order';

  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Order'),
      ),
      body: Center(
        child: Text('My Order Screen'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyCartScreen extends StatelessWidget {
  static const String routeName = '/my_cart';

  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Center(
        child: Text('My Cart Screen'),
      ),
    );
  }
}

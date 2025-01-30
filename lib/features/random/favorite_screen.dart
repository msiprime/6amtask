import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routeName = '/favorite';
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: Text('Fetch Data'),
        ),
      ),
    );
  }
}

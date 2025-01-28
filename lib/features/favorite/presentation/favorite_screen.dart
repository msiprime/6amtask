import 'package:flutter/material.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/core/global/logger/logger.dart';
import 'package:stackfood/core/global/network/dio_client.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routeName = '/favorite';
  const FavoriteScreen({super.key});
  Future<void> _fetchData() async {
    final response = await sl.get<DioClient>().get('/api/v1/products/popular');

    if (response.statusCode == 200) {
      logE('Response: ${response.data}');
    } else {
      logE('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: Center(
        child: TextButton(
          onPressed: _fetchData,
          child: Text('Fetch Data'),
        ),
      ),
    );
  }
}

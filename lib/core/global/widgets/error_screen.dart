import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    this.errorMessage,
  });

  final String? errorMessage;

  static const routeName = 'error_screen';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage ?? 'Oops! An error has occurred.',
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}

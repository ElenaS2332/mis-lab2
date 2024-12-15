import 'package:flutter/material.dart';

class JokeError extends StatelessWidget {
  final String message;

  const JokeError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}

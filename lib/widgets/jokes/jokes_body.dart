import 'package:flutter/material.dart';
import 'package:random_jokes_lab/models/joke.dart';
import 'package:random_jokes_lab/widgets/error.dart';
import 'package:random_jokes_lab/widgets/jokes/jokes_list.dart';

class JokesBody extends StatelessWidget {
  final Future<List<Joke>> jokesFuture;

  const JokesBody({super.key, required this.jokesFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Joke>>(
      future: jokesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return JokeError(message: 'Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No jokes found.'));
        } else {
          return JokesList(jokes: snapshot.data!);
        }
      },
    );
  }
}

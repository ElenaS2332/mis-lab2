import 'package:flutter/material.dart';
import 'package:random_jokes_lab/models/joke.dart';

class RandomJokeCard extends StatelessWidget {
  final Joke joke;
  final VoidCallback onGetNewJoke;

  const RandomJokeCard(
      {super.key, required this.joke, required this.onGetNewJoke});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            joke.setup,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            joke.punchline,
            style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: onGetNewJoke,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            child: const Text('Get Another Joke'),
          ),
        ],
      ),
    );
  }
}

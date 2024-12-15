import 'package:flutter/material.dart';
import 'package:random_jokes_lab/models/joke.dart';
import 'package:random_jokes_lab/services/api_service.dart';
import 'package:random_jokes_lab/widgets/jokes/random_joke_card.dart';

class RandomJokeScreen extends StatefulWidget {
  const RandomJokeScreen({super.key});

  @override
  State<RandomJokeScreen> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  bool isLoading = true;
  Joke? joke;

  @override
  void initState() {
    super.initState();
    setJoke();
  }

  Future<void> setJoke() async {
    setState(() {
      isLoading = true;
    });
    final fetchedJoke = await ApiService.fetchRandomJoke();
    setState(() {
      joke = fetchedJoke;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Joke'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : RandomJokeCard(joke: joke!, onGetNewJoke: setJoke),
      ),
    );
  }
}

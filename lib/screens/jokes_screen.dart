import 'package:flutter/material.dart';
import 'package:random_jokes_lab/models/joke.dart';
import 'package:random_jokes_lab/services/api_service.dart';
import '../widgets/jokes/jokes_body.dart';

class JokesScreen extends StatefulWidget {
  final String category;

  const JokesScreen({super.key, required this.category});

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  late Future<List<Joke>> jokesFuture;
  late String currentCategory;

  @override
  void initState() {
    super.initState();
    currentCategory = widget.category;
    jokesFuture = ApiService.fetchJokes(currentCategory);
  }

  @override
  void didUpdateWidget(covariant JokesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      setState(() {
        currentCategory = widget.category;
        jokesFuture = ApiService.fetchJokes(currentCategory);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes: ${widget.category}'),
      ),
      body: JokesBody(jokesFuture: jokesFuture),
    );
  }
}

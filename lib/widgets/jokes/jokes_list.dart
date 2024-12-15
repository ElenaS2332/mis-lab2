import 'package:flutter/widgets.dart';
import 'package:random_jokes_lab/models/joke.dart';

import 'joke_card.dart';

class JokesList extends StatelessWidget {
  final List<Joke> jokes;

  const JokesList({super.key, required this.jokes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        final joke = jokes[index];
        return JokeCard(joke: joke);
      },
    );
  }
}

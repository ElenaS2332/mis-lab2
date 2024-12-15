import 'package:flutter/material.dart';
import 'package:random_jokes_lab/screens/random_joke_screen.dart';
import 'package:random_jokes_lab/services/api_service.dart';
import '../widgets/categories/category_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<String> jokeCategories = [];

  @override
  void initState() {
    super.initState();
    setJokeCategories();
  }

  Future<void> setJokeCategories() async {
    setState(() {
      isLoading = true;
    });
    final fetchedJokeCategories = await ApiService.getJokeCategories();
    setState(() {
      jokeCategories = fetchedJokeCategories;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Find good jokes",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RandomJokeScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.auto_awesome,
              color: Colors.white,
              size: 24,
            ),
          )
        ],
      ),
      body: CategoriesGrid(categories: jokeCategories),
    );
  }
}

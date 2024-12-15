import 'package:flutter/material.dart';
import 'package:random_jokes_lab/screens/jokes_screen.dart';
import 'package:random_jokes_lab/widgets/categories/joke_category_data.dart';

class CategoryCard extends StatelessWidget {
  final String category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.green,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JokesScreen(category: category),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green.shade300),
                borderRadius: BorderRadius.circular(10)),
            child: JokeCategoryData(name: category),
          )),
    );
  }
}

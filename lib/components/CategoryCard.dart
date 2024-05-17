import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.abc_sharp),
          ),
        ),
        const SizedBox(height: 8),
        Text(categoryName)
      ],
    );
  }
}

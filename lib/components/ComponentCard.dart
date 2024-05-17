import 'package:flutter/material.dart';

class ComponentCard extends StatelessWidget {
  const ComponentCard(
      {super.key,
        required this.componentName,
        required this.categoryName,
        required this.imgThumbnail});

  final String componentName;
  final String categoryName;
  final String imgThumbnail;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image(
              image: AssetImage(imgThumbnail),
              height: 100,
              width: 100,
              fit: BoxFit.fitWidth),
          Column(
            children: [
              const Text(
                "Component Name",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(componentName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15))
            ],
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              const Text(
                "Category Name",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(categoryName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15))
            ],
          )
        ],
      ),
    );
  }
}
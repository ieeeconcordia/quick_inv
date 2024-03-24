import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Welcome to QuickInv🗄️!'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          Text(
            title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment
                .start, // Align children horizontally at the start
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 20.0), // Add left padding to align with the title
                child: Text(
                  "What are you looking for today?",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SearchBar(hintText: "Search..."),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Quick Categories",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(children: [
              CategoryCard(categoryName: "Capacitors"),
              CategoryCard(categoryName: "Resistors")
            ]),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 8),
              child:
                  Text("View all components", style: TextStyle(fontSize: 20)),
            ),
          ),
          const Column(
            children: [ComponentCard(componentName: "Resistor OHM", categoryName: "Resistors", imgThumbnail: "fdsafd")],
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(destinations: const [],),
    );
  }
}

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
          Image(image: AssetImage(imgThumbnail)),
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

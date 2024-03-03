import 'package:flutter/cupertino.dart';
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
        children: [
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
          const Row(children: [
            CatgeoryCard(categoryName: "Capacitor"),
            CatgeoryCard(categoryName: "resistivity")
          ])
        ],
      ),
    );
  }
}

class CatgeoryCard extends StatelessWidget {
  const CatgeoryCard({super.key, required this.categoryName});

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

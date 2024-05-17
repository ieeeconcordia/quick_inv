import 'package:flutter/material.dart';

// Import the screens
import 'screens/HomeScreen.dart';
import 'screens/ActionScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickInv',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[const HomeScreen(), const ActionScreen()][currentPageIdx],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIdx,
        destinations: const <Widget>[
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              selectedIcon: Icon(Icons.home)),
          NavigationDestination(
              icon: Icon(Icons.lock_outline),
              label: "Actions",
              selectedIcon: Icon(Icons.lock)),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIdx = index;
          });
        },
        backgroundColor: const Color(0xFF0077b6),
      ),
    );
  }
}


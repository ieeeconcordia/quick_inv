import 'package:flutter/material.dart';
// Import your custom components
import 'package:quick_inv/components/ComponentCard.dart';
import 'package:quick_inv/components/CategoryCard.dart';
// Assuming SearchBar is a custom widget, import it as well

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the lists for categories and components
    final List<Map<String, String>> categories = [
      {"categoryName": "Capacitors"},
      {"categoryName": "Resistors"},
    ];

    final List<Map<String, String>> components = [
      {
        "componentName": "Resistor OHM",
        "categoryName": "Resistors",
        "imgThumbnail": "assets/resist.jpg"
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            // App Bar
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0077b6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "QuickInv 🗄️",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Align children horizontally at the start
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.0,
                            bottom:
                                10), // Add left padding to align with the title
                        child: Text(
                          "What are you looking for today?",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  
                  // Search Bar
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SearchBar(hintText: "Search..."),
                  ),

                  // Search Buttons
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: FilledButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          child: const Text("Search Tags"),
                        )),
                        const SizedBox(width: 10),
                        Expanded(
                            child: FilledButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                          child: const Text("RFID Search"),
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Home Screen Content/Body
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Quick Categories
                    const Text("Quick Categories",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: categories
                          .map((category) => CategoryCard(
                                categoryName: category["categoryName"]!,
                              ))
                          .toList(),
                    ),

                    const SizedBox(height: 20),

                    // View All Components
                    const Text("View all components",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),

                    Column(
                      children: components
                          .map((component) => ComponentCard(
                                componentName: component["componentName"]!,
                                categoryName: component["categoryName"]!,
                                imgThumbnail: component["imgThumbnail"]!,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

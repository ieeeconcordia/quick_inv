import 'package:flutter/material.dart';
import 'package:quick_inv/components/ComponentCard.dart';
import 'package:quick_inv/components/CategoryCard.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: const Color(0xFF0077b6),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                "Welcome to QuickInv! 🗄️",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.black)),
                    child: const Text("Search Tags"),
                  ),
                  const SizedBox(width: 10),
                  FilledButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.black)),
                    child: const Text("RFID Search"),
                  )
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
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
            child: Text("View all components", style: TextStyle(fontSize: 20)),
          ),
        ),
        const Column(
          children: [
            ComponentCard(
                componentName: "Resistor OHM",
                categoryName: "Resistors",
                imgThumbnail: "assets/resist.jpg")
          ],
        )
      ],
    );
  }
}
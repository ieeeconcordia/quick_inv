import 'package:flutter/material.dart';

class FirstUpdatePage extends StatefulWidget {
  const FirstUpdatePage({super.key});

  @override
  State<FirstUpdatePage> createState() => _FirstUpdatePageState();
}

class _FirstUpdatePageState extends State<FirstUpdatePage> {
  final TextEditingController typeController = TextEditingController();
  String? selectedType;

  final TextEditingController partController = TextEditingController();
  String? selectedPart;

  List<String> entries = ["Resistor", "Capacitor", "Diode", "Other"];
  List<String> cmpNums = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Update an Item",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 15),
            const Text(
                "Choose the type and part number of the component that you wish to update"),
            const SizedBox(height: 15),
            DropdownMenu<String>(
              initialSelection: "",
              controller: typeController,
              requestFocusOnTap: true,
              label: const Text("Component Type"),
              width: 250,
              onSelected: (String? type) {
                setState(() {
                  selectedType = type;
                });
              },
              dropdownMenuEntries:
              entries.map<DropdownMenuEntry<String>>((String entry) {
                return DropdownMenuEntry<String>(
                  value: entry,
                  label: entry,
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            DropdownMenu<String>(
              initialSelection: "",
              controller: partController,
              requestFocusOnTap: true,
              label: const Text("Component Type"),
              width: 250,
              onSelected: (String? part) {
                setState(() {
                  selectedPart = part;
                });
              },
              dropdownMenuEntries:
              cmpNums.map<DropdownMenuEntry<String>>((String entry) {
                return DropdownMenuEntry<String>(
                  value: entry,
                  label: entry,
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => print(""),
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)),
              child: const Text("Done"),
            )
          ]),
        ));
  }
}

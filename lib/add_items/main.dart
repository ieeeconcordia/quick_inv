import 'package:flutter/material.dart';

class FirstAddPage extends StatefulWidget {
  const FirstAddPage({super.key});

  @override
  State<FirstAddPage> createState() => _FirstAddPageState();
}

class _FirstAddPageState extends State<FirstAddPage> {
  final TextEditingController typeController = TextEditingController();
  String? selectedType;

  List<String> entries = ["Resistor", "Capacitor", "Diode", "Other"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Text(
        "Add a new Item",
        style: TextStyle(fontSize: 25),
      ),
      const SizedBox(height: 15),
      const Text("Choose the type of component you want to add"),
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
      FilledButton(
        onPressed: () => print(""),
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)),
        child: const Text("Done"),
      )
    ]));
  }
}

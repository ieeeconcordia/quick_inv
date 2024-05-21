import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:quick_inv/add_items/SecondAddPage.dart';
import 'package:quick_inv/pbInstance.dart';

class FirstAddPage extends StatefulWidget {
  const FirstAddPage({super.key});

  @override
  State<FirstAddPage> createState() => _FirstAddPageState();
}

class _FirstAddPageState extends State<FirstAddPage> {
  final TextEditingController typeController = TextEditingController();
  String? selectedType;

  List<RecordModel> allTags = [];

  List<String> entries = ["Resistor", "Capacitor", "Diode", "Other"];

  Future<void> fetchAllTags() async {
    try {
      List<RecordModel> tags =
          await pb.collection('tags').getFullList(sort: '-created');
      setState(() {
        allTags = tags;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllTags();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Add a new Item",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 15),
        const Text("Choose the type of component you want to add"),
        const SizedBox(height: 15),
        Row(
            children: allTags.map((tag) {
          return Chip(label: Text(tag.data['name']));
        }).toList()),
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
          onPressed: () async {
            await pb.collection('parts').create(body: {});
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SecondAddPage()));
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)),
          child: const Text("Done"),
        )
      ]),
    ));
  }
}

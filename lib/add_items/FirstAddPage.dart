import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:quick_inv/add_items/SecondAddPage.dart';
import 'package:quick_inv/pocketbase.dart';

class FirstAddPage extends StatefulWidget {
  const FirstAddPage({super.key});

  @override
  State<FirstAddPage> createState() => _FirstAddPageState();
}

class _FirstAddPageState extends State<FirstAddPage> {
  final TextEditingController typeController = TextEditingController();
  String? selectedType;

  List<RecordModel> allTags = [];

  Future<void> fetchAllTags() async {
    try {
      print("Fetching tags");
      List<RecordModel> tags =
          await pb.collection('tags').getFullList(sort: '-created');
      setState(() {
        print(tags);
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
      appBar: AppBar(
        title: const Text("Add New Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Text(
              "Add a new Item",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 15),
            const Text("Choose the type of component you want to add"),
            const SizedBox(height: 15),

            if (allTags.isNotEmpty)
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
                dropdownMenuEntries: allTags
                    .map<DropdownMenuEntry<String>>((RecordModel tag) {
                  return DropdownMenuEntry<String>(
                    value: tag.data['tag_name'],
                    label: tag.data['tag_name'],
                  );
                }).toList(),
              )
            else
              const CircularProgressIndicator(), // Show a loading indicator while fetching tags
            const SizedBox(height: 20),
            Center(
              child: FilledButton(
                onPressed: () async {
                  await pb.collection('parts').create(body: {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondAddPage(),
                    ),
                  );
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                ),
                child: const Text("Done"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

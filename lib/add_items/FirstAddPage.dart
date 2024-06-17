import 'dart:developer';

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
  String? selectedTagId; // Variable to store the selected tag ID

  List<RecordModel> allTags = [];

  Future<void> fetchAllTags() async {
    try {
      log("Fetching tags");
      List<RecordModel> tags =
          await pb.collection('tags').getFullList(sort: '-created');
      setState(() {
        debugPrint('$tags');
        allTags = tags;
      });
    } catch (e) {
      debugPrint('$e');
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
              "",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 15),
            const Text("Choose the type of component you want to add"),
            const SizedBox(height: 15),

            if (allTags.isNotEmpty)
              DropdownButton<String>(
                value: selectedType,
                onChanged: (String? type) {
                  setState(() {
                    selectedType = type;
                    selectedTagId = allTags
                        .firstWhere((tag) => tag.data['tag_name'] == type)
                        .id; // Store the selected tag ID
                  });
                },
                items: allTags.map<DropdownMenuItem<String>>((RecordModel tag) {
                  return DropdownMenuItem<String>(
                    value: tag.data['tag_name'],
                    child: Text(tag.data['tag_name']),
                  );
                }).toList(),
              )
            else
              const CircularProgressIndicator(),
            // Show a loading indicator while fetching tags
            const SizedBox(height: 20),
            Center(
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondAddPage(
                          tagId:
                              selectedTagId!), // Pass the selected tag ID to the next page
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

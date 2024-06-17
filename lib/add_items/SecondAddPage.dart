import 'package:flutter/material.dart';
import 'package:quick_inv/pocketbase.dart';

class SecondAddPage extends StatelessWidget {
  final String tagId;

  const SecondAddPage({super.key, required this.tagId});

  Future<String?> fetchTagName() async {
    final record = await pb.collection('tags').getOne(tagId);
    return record.getDataValue<String>('tag_name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Add new item",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 15),
            FutureBuilder<String?>(
              future: fetchTagName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Text('Tag not found');
                } else {
                  return Text("Add the properties for this ${snapshot.data}");
                }
              },
            ),
            const SizedBox(height: 15),
            FilledButton(
              onPressed: () {
                debugPrint("Hello world");
              },
              child: const Text("Done"),
            ),
          ],
        ),
      ),
    );
  }
}

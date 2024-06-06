import 'package:flutter/material.dart';

class SecondUpdatePage extends StatelessWidget {
  const SecondUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Update new item",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 15),
                const Text("Update the {item_type} field data"),
                const SizedBox(height: 15,),
                // Input data that will depend on the {item_type}
                FilledButton(onPressed: () => {
                  print("")
                }, child: const Text("Done"))
              ],
            )));
  }
}

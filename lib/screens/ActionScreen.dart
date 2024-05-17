import 'package:flutter/material.dart';
import 'package:quick_inv/add_items/FirstAddPage.dart';
import 'package:quick_inv/edit_items/FirstUpdatePage.dart';
import 'package:quick_inv/screens/DeleteItemScreen.dart';

class ActionScreen extends StatelessWidget {
  const ActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: FilledButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstAddPage()))
                },
                style: const ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll<Color>(Colors.blue)),
                child: const Row(
                  children: [Text("New Item"), Icon(Icons.add)],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: FilledButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstUpdatePage()))
                },
                style: const ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll<Color>(Colors.green)),
                child: const Row(
                  children: [Text("Update Item"), Icon(Icons.edit)],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: FilledButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DeleteItemScreen()))
                },
                style: const ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll<Color>(Colors.red)),
                child: const Row(
                  children: [Text("Delete Item"), Icon(Icons.minimize_rounded)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

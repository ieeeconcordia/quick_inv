import 'package:flutter/material.dart';
import 'package:quick_inv/main.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key, required this.succMsg});
  final String succMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Column(
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 60,
            ),
            const SizedBox(height: 15),
            Text(
              succMsg,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            FilledButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyHomePage())),
                child: const Text("Back to Main"))
          ],
        ),
      ),
    );
  }
}

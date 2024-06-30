import 'package:flutter/material.dart';
import 'package:quick_inv/components/MyForm.dart';
import 'package:quick_inv/pocketbase.dart';
import 'package:quick_inv/screens/SuccessScreen.dart';

class SecondAddPage extends StatefulWidget {
  final String tagId;

  const SecondAddPage({super.key, required this.tagId});

  @override
  _SecondAddPageState createState() => _SecondAddPageState();
}

class _SecondAddPageState extends State<SecondAddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemNumberController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  Future<String?> fetchTagName() async {
    final record = await pb.collection('tags').getOne(widget.tagId);
    return record.getDataValue<String>('tag_name');
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _itemNumberController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
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
            MyForm(
              formKey: _formKey,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Item Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an item name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Item Number"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an item number";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Quantity"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Price"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                FilledButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      final itemName = _itemNameController.text;
                      final itemNumber = _itemNumberController.text;
                      final quantity = _quantityController.text;
                      final price = _priceController.text;

                      final body = <String, dynamic>{
                        "part_name": itemName,
                        "part_number": itemNumber,
                        "quantity": quantity,
                        "price": price,
                        "tags": widget.tagId
                      };

                      debugPrint("$body");

                      await pb.collection('parts').create(body: body);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessScreen(
                            succMsg: "You have successfully added this item!",
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text("Done"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

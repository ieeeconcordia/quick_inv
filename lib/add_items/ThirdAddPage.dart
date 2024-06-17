import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ThirdAddPage extends StatefulWidget {
  const ThirdAddPage({super.key});

  @override
  State<ThirdAddPage> createState() => _ThirdAddPageState();
}

class _ThirdAddPageState extends State<ThirdAddPage> {
  File? _image;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No Image picked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "",
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 15),
          const Text("Add the {item_type} info"),
          const SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () => {getImageGallery()},
              child: DottedBorder(
                  borderType: BorderType.Rect,
                  radius: const Radius.circular(20),
                  child: _image != null
                      ? Image.file(
                          _image!.absolute,
                          fit: BoxFit.cover,
                        )
                      : const Center(
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 10,
                          ),
                        ))),
          const SizedBox(height: 15),
          FilledButton(
              onPressed: () => getImageGallery(), child: const Text("Done"))
        ],
      ),
    ));
  }
}

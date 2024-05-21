import 'package:flutter/material.dart';

class ChipTag extends StatelessWidget {
  const ChipTag({super.key, required this.tagName});

  final String tagName;

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(tagName));
  }
}
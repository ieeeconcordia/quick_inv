import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  final List<Widget> children;
  final GlobalKey<FormState> formKey;

  const MyForm({super.key, required this.children, required this.formKey});

  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: widget.children,
      ),
    );
  }
}

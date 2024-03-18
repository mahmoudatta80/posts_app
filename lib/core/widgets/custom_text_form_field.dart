import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final int maxLines;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.name,
      required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: (val) => val!.isEmpty ? "$name Can't be empty" : null,
      decoration: InputDecoration(
        hintText: name,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

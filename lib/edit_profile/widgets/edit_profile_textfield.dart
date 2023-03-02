import 'package:flutter/material.dart';

class EditProfileTextField extends StatelessWidget {
  final String textFieldLabel;
  final TextEditingController controller;

  const EditProfileTextField({
    super.key,
    required this.textFieldLabel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontWeight: FontWeight.w800),
      decoration: InputDecoration(
        labelStyle:
            const TextStyle(color: Colors.black26, fontWeight: FontWeight.bold),
        labelText: textFieldLabel,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

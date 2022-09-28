import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeTextField extends StatelessWidget {
  final String textFieldLabel;
  final Function navigationFunction;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;

  const HomeTextField(
      {Key? key,
      required this.textFieldLabel,
      required this.navigationFunction,
      required this.controller,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2.5),
      child: TextFormField(
        controller: controller,
        inputFormatters: inputFormatters,
        maxLines: null,
        readOnly: true,
        style: const TextStyle(fontWeight: FontWeight.w800),
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelStyle: const TextStyle(
              color: Colors.black26, fontWeight: FontWeight.bold),
          labelText: textFieldLabel,
          suffixIcon: const Icon(Icons.arrow_forward_ios_rounded),
        ),
        onTap: () => navigationFunction(),
      ),
    );
  }
}

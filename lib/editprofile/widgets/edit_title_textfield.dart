import 'package:flutter/material.dart';

class EditTitleTextField extends StatelessWidget {
  final String titleName;

  const EditTitleTextField({Key? key, required this.titleName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 40, 10, 0),
      child: Text(
        titleName,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

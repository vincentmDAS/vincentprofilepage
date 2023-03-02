import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/constant.dart';
import '../models/profile.dart';
import '../widgets/edit_title_textfield.dart';

class EditPhoneScreen extends StatelessWidget {
  const EditPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneTextController =
        TextEditingController(text: context.watch<Profile>().phone);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const EditTitleTextField(titleName: 'What\'s your phone number?'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: TextFormField(
                  controller: phoneTextController,
                  inputFormatters: [kMaskFormatter],
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                    labelText: 'Your phone number?',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0.0)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: SizedBox(
                  height: 60,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      context
                          .read<Profile>()
                          .updatePhone(phoneTextController.text);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Update'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

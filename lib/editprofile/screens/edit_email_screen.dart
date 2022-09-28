import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vincentprofilepage/editprofile/widgets/edit_title_textfield.dart';

import '../models/profile.dart';

class EditEmailScreen extends StatelessWidget {
  const EditEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailTextController =
        TextEditingController(text: context.watch<Profile>().email);

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
            children: [
              const EditTitleTextField(titleName: 'What\'s your email?'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: TextFormField(
                  controller: emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                    labelText: 'Your email address',
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
                          .updateEmail(emailTextController.text);
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

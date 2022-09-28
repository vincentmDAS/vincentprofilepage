import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/profile.dart';
import '../widgets/edit_profile_textfield.dart';
import '../widgets/edit_title_textfield.dart';

class EditNameScreen extends StatelessWidget {
  const EditNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firstNameTextController =
        TextEditingController(text: context.watch<Profile>().firstName);

    final lastNameTextController =
        TextEditingController(text: context.watch<Profile>().lastName);

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
              const EditTitleTextField(titleName: 'What\'s your name?'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Flexible(
                      child: EditProfileTextField(
                        controller: firstNameTextController,
                        textFieldLabel: 'First Name',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Flexible(
                      child: EditProfileTextField(
                        controller: lastNameTextController,
                        textFieldLabel: 'Last Name',
                      ),
                    ),
                  ],
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
                          .updateFirstName(firstNameTextController.text);
                      context
                          .read<Profile>()
                          .updateLastName(lastNameTextController.text);
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

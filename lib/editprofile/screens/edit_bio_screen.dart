import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vincentprofilepage/editprofile/widgets/edit_title_textfield.dart';

import '../models/profile.dart';

class EditBioScreen extends StatelessWidget {
  const EditBioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bioTextController =
        TextEditingController(text: context.watch<Profile>().bio);

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
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const EditTitleTextField(
                    titleName: 'What\'s type of passenger are you?'),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: TextFormField(
                    style: const TextStyle(fontWeight: FontWeight.w800),
                    controller: bioTextController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.black26, fontWeight: FontWeight.bold),
                      hintText:
                          'Write a little bit about yourself. Do you like chatting? Are you a smoke? Do you bring pets with you? Etc.',
                      hintMaxLines: 4,
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
                            .updateBio(bioTextController.text);
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
      ),
    );
  }
}

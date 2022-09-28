import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/profile.dart';
import '../widgets/edit_title_textfield.dart';

class EditPhotoScreen extends StatelessWidget {
  const EditPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final previousImage = context.read<Profile>().photo;

    return WillPopScope(
      onWillPop: () {
        context.read<Profile>().updatePhoto(previousImage);
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const EditTitleTextField(
                    titleName: 'Upload a photo of yourself:'),
                Consumer<Profile>(
                  builder: (builder, provider, _) {
                    return InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 30),
                        child: provider.photo,
                      ),
                      onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context,
                                [bool mounted = true]) =>
                            SimpleDialog(
                          title: const Text('Change photo'),
                          children: <Widget>[
                            SimpleDialogOption(
                              onPressed: () async {
                                await _imagePicker(
                                    provider, ImageSource.camera);
                                if (!mounted) return;
                                Navigator.of(context).pop();
                              },
                              child: const Text('Take new photo'),
                            ),
                            SimpleDialogOption(
                              onPressed: () async {
                                await _imagePicker(
                                    provider, ImageSource.gallery);
                                if (!mounted) return;
                                Navigator.of(context).pop();
                              },
                              child: const Text('Select new photo'),
                            )
                          ],
                        ),
                      ),
                    );
                  },
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
                        Navigator.pop(context);
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

  Future<void> _imagePicker(Profile provider, ImageSource imageSource) async {
    XFile? image = await ImagePicker().pickImage(source: imageSource);

    if (image != null) {
      final imageToFile = Image.file(File(image.path));
      provider.updatePhoto(imageToFile);
    }
  }
}

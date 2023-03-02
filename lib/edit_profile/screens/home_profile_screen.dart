import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vincentprofilepage/edit_profile/screens/edit_bio_screen.dart';
import 'package:vincentprofilepage/edit_profile/screens/edit_email_screen.dart';

import '../common/constant.dart';
import '../models/profile.dart';
import '../widgets/home_textfield.dart';
import 'edit_name_screen.dart';
import 'edit_phone_screen.dart';
import 'edit_photo_screen.dart';

class HomeProfileScreen extends StatelessWidget {
  const HomeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameTextController = TextEditingController(
        text:
            '${context.watch<Profile>().firstName} ${context.watch<Profile>().lastName}');
    final phoneTextController =
        TextEditingController(text: context.watch<Profile>().phone);
    final emailTextController =
        TextEditingController(text: context.watch<Profile>().email);
    final bioTextController =
        TextEditingController(text: context.watch<Profile>().bio);
    final photo = context.watch<Profile>().photo;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const _EditProfileText(),
                  _ProfileAvatar(photo: photo),
                  HomeTextField(
                    textFieldLabel: 'Name',
                    controller: nameTextController,
                    navigationFunction: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const EditNameScreen(),
                        ),
                      );
                    },
                    inputFormatters: null,
                  ),
                  HomeTextField(
                    textFieldLabel: 'Phone',
                    inputFormatters: [kMaskFormatter],
                    controller: phoneTextController,
                    navigationFunction: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const EditPhoneScreen(),
                        ),
                      );
                    },
                  ),
                  HomeTextField(
                    textFieldLabel: 'Email',
                    controller: emailTextController,
                    navigationFunction: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const EditEmailScreen(),
                        ),
                      );
                    },
                  ),
                  HomeTextField(
                    textFieldLabel: 'Tell us about yourself',
                    controller: bioTextController,
                    navigationFunction: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const EditBioScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({
    Key? key,
    required this.photo,
  }) : super(key: key);

  final Image photo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
      child: InkWell(
        child: CircleAvatar(
          radius: 76,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.grey,
            backgroundImage: photo.image,
            child: Stack(
              children: const [
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.edit),
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => const EditPhotoScreen(),
            ),
          );
        },
      ),
    );
  }
}

class _EditProfileText extends StatelessWidget {
  const _EditProfileText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Edit Profile',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

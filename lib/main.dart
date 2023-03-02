import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_profile/models/profile.dart';
import 'edit_profile/screens/home_profile_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => Profile(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Profile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeProfileScreen(),
    );
  }
}

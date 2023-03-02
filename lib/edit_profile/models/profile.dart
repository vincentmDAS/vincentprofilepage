import 'package:flutter/material.dart';

class Profile with ChangeNotifier {
  String _firstName = 'Vincent';
  String _lastName = 'Montaño';
  String _phone = '(317) 487-9465';
  String _email = 'work4montano@gmail.com';
  Image _photo = const Image(image: AssetImage('assets/vincent.jpg'));
  String _bio =
      'I\'m a Filipino mobile developer living the dream in Indianapolis!';

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get phone => _phone;
  String get email => _email;
  Image get photo => _photo;
  String get bio => _bio;

  void updateFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void updateLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void updatePhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void updateBio(String bio) {
    _bio = bio;
    notifyListeners();
  }

  void updatePhoto(Image photo) {
    _photo = photo;
    notifyListeners();
  }
}

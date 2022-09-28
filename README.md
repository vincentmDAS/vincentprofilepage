# vincentprofilepage

A flutter mobile application that functions like of a profile page. Data does not saved to a database, but the application function as expected until restarted.

Features:
Markup : _ Provider as State Management
_ Edit Profile Photo via Camera or Gallery
_ Masked Phone Texfield
_ iOS Page Navigation

## Getting Started

iOS
This plugin requires iOS 9.0 or higher.

Starting with version 0.8.1 the iOS implementation uses PHPicker to pick (multiple) images on iOS 14 or higher. As a result of implementing PHPicker it becomes impossible to pick HEIC images on the iOS simulator in iOS 14+. This is a known issue. Please test this on a real device, or test with non-HEIC images until Apple solves this issue. 63426347 - Apple known issue

Check if missing and add the following keys to your Info.plist file, located in <project root>/ios/Runner/Info.plist:

NSPhotoLibraryUsageDescription - describe why your app needs permission for the photo library. This is called Privacy - Photo Library Usage Description in the visual editor.
NSCameraUsageDescription - describe why your app needs access to the camera. This is called Privacy - Camera Usage Description in the visual editor.
NSMicrophoneUsageDescription - describe why your app needs access to the microphone, if you intend to record videos. This is called Privacy - Microphone Usage Description in the visual editor.

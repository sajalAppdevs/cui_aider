# CUI Aider

CUI Aider is a Flutter-based mobile application designed to provide assistance and services for the COMSATS University Islamabad community. The app integrates various features to enhance the campus experience and provide easy access to university resources.

## Features

- **Firebase Integration**: Secure authentication and real-time data storage
- **Google Sign-In**: Easy access with Google account credentials
- **Image Management**: Upload and manage images with Firebase Storage
- **Interactive UI**: Smooth user experience with Rive animations
- **Carousel Display**: Dynamic content presentation using carousel slider
- **Web Content Integration**: Built-in webview for accessing web resources
- **Smart Search**: Type-ahead search functionality
- **360° View**: Panoramic view support for immersive experiences
- **File Management**: Local file handling and storage capabilities
- **Network Operations**: Efficient API handling with Dio
- **Persistent Storage**: Local data management with shared preferences

## Getting Started

### Prerequisites

- Flutter SDK (>=2.12.0 <3.0.0)
- Dart SDK
- Android Studio / VS Code
- Firebase account and project setup

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Configure Firebase:
   - Add your `google-services.json` for Android
   - Add your `GoogleService-Info.plist` for iOS
4. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

Key packages used in this project:

- **Firebase Suite**:
  - firebase_core: ^2.4.1
  - firebase_storage: ^11.0.10
  - firebase_auth: ^4.2.5
  - cloud_firestore: ^4.3.1
  - firebase_database: ^10.0.9

- **UI Components**:
  - carousel_slider: ^4.2.1
  - rive: ^0.9.1
  - flutter_typeahead: ^3.2.3
  - panorama: ^0.4.1

- **Utilities**:
  - dio: ^4.0.6
  - shared_preferences: ^2.0.17
  - image_picker: ^0.8.6+1
  - permission_handler: ^6.0.1

For a complete list of dependencies, please check the `pubspec.yaml` file.

## Assets

The application includes:
- Image assets in the `Assets/images/` directory
- Rive animations in the `Assets/riv/` directory

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is proprietary and maintained by COMSATS University Islamabad.

## Contact

For support or queries, please contact the development team at COMSATS University Islamabad.

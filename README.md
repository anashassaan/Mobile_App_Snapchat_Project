---

# Snapchat Clone Project

## Overview
This project is a clone of the popular Snapchat app, created using Flutter. It includes features such as user authentication, camera functionality , and user profile management.

## Features
- **User Authentication**: Sign up, log in, and log out functionality using Firebase Authentication.
- **Camera Functionality**: Capture photos
- **User Profile**: View and edit user profiles, with the ability to log out.
- **Chat**: Basic chat functionality.
- **Stories**: View and create stories.
- **Location**: Location-based services.
- **Videos**: View videos and spotlight content.

## Requirements
- Flutter SDK
- Firebase account
- Dependencies listed in `pubspec.yaml`

## Installation
1. Clone the repository:
    ```bash
   https://github.com/anashassaan/Mobile_App_Snapchat_Project.git
    ```
2. Navigate to the project directory:
    ```bash
    cd snapchat-clone
    ```
3. Install dependencies:
    ```bash
    flutter pub get
    ```
4. Set up Firebase:
    - Add your `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files in the respective directories.
    - Ensure you have enabled authentication methods in your Firebase console.

## Running the Project
To run the project, use the following command:
```bash
flutter run
```

## Project Structure
A brief overview of the project structure:
```
snapchat-clone/
├── lib/
│   ├── main.dart
│   ├── view/
│   │   ├── camra_screen.dart
│   │   ├── chat.dart
│   │   ├── getstarted_screen.dart
│   │   ├── home_screen.dart
│   │   ├── initial_screen.dart
│   │   ├── location_screen.dart
│   │   ├── login_screen.dart
│   │   ├── signUp_email.dart
│   │   ├── signup_bd_screen.dart
│   │   ├── signup_screen.dart
│   │   ├── splash_screen.dart
│   │   ├── stories.dart
│   │   ├── user_profile.dart
│   │   ├── videos.dart
│   ├── controllers/
│   │   ├── login_controller.dart
│   │   ├── signup_controller.dart
│   ├── utils/
│   │   ├── colors.dart
│   │   ├── customWidgts.dart
├── pubspec.yaml
```

## Usage
- Open the app.
- Register or log in to your account.
- Use the camera screen to take photos.
- Access your user profile to log out.

## Dependencies
- `flutter`
- `firebase_auth`
- `camera`
- `camera_deep_ar`
- `image_picker`
- `path_provider`
- `get`

## Contributing
Feel free to fork this repository and contribute by submitting pull requests. Please ensure your code follows the project's coding standards and passes all tests.

## License
This project is licensed under the MIT License.

---

# Screenshots
![Login Screen](screenshots/login_screen.png)
![Camera Screen](screenshots/camera_screen.png)
![User Profile Screen](screenshots/user_profile.png)

---
Submission
Share the link to your GitHub repository.

Example Mockup
Here’s an example of how your mockup should look:


Example Video Demo
Here’s an example of how to embed your video:


If you find this repository helpful, don’t forget to star it!

Feedback
If you have any suggestions, feedback, or queries, feel free to reach out or raise an issue on the repository. Let’s make learning Flutter an enjoyable journey!

⭐ Star This Repository: If you find this repository helpful, kindly star it to show your appreciation and support.


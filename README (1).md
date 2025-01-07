
# ChitChat

Flutter ChitChat is a modern and intuitive chat application built with Flutter, offering seamless real-time messaging and a user-friendly interface. It’s designed to connect people effortlessly, enabling one-on-one and group chats with features like instant notifications, media sharing, emojis, and customizable themes.


## Features

- Real-time messaging: Users can send and receive messages in real-time.
- Firebase Firestore: Data storage is handled by Firebase Firestore, providing a secure and fast way to store and retrieve data.
- Firebase Authentication.
- Custom Animation.



## Technologies Used
- Dart: Primary language for app development.
- Hero Animation
- Stram Builder and Refactoring Programming
- Firebase Realtime Database: For real-time message synchronization.
- Firebase Authentication: For user login and registration (email-password, Google, etc.).
- Firebase Cloud Storage: For storing shared media files (images, audio).
- Firebase Cloud Messaging (FCM): For push notifications.
- Firebase Firestore (Optional): An alternative to Realtime Database for improved querying
## Uses
- Open the app and sign in/ sign up
- Send and receive messages in real-time
- Receive notifications even when the app is not open
## Contributing

Contributions are welcome! To contribute:

- Fork the repository.
- Create a feature branch (git checkout -b feature-branch).
- - Commit your changes (git commit -m 'Add a new feature').
- Push the branch (git push origin feature-branch).
- Create a Pull Request.


## Installation

Install my-project 
- Clone The project
https://github.com/mehedidevv/ChitChat.git

- Open the project in Android Studio
Setup Firebase
- Create a Firebase project in the Firebase Console.
- Add an Android app to your Firebase project and download the google-services.json file.
- Add an IOS app to your Firebase project and download the google-services.json file.
- Place the google-services.json file in the app directory.
- Enable Firebase Authentication, Firebase Realtime Database, and Firebase Cloud Storage.

Build The project
- Flutter Pub get and ensure all dependencies are installed.
- Build and run the app on your device or emulator.
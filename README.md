# 📱 E-Fashion Flutter App
![Project Version](https://img.shields.io/badge/version-0.0.1-blue)
![GitHub license](https://img.shields.io/github/license/Bit-Camp-IO/E-Fashion_Flutter)
![GitHub last commit](https://img.shields.io/github/last-commit/Bit-Camp-IO/E-Fashion_Flutter)
![GitHub issues](https://img.shields.io/github/issues/Bit-Camp-IO/Bit-Camp-IO/E-Fashion_Flutter)

This repository contains the source code for the E-Fashion Flutter App, This repository applies clean archticture princeples by component.

## 🚀: Features

- Material 3 Support With Theme Switcher (Light - Dark)
- Auth Feature (Login - SignUp - Forget Password (OTP))
- Dynamic Home Screen (Offers - Collections - Brands - Filter Home By Categories - Fast Add To Cart - Disover (Brands - Offers) "PAGINATED" )
- Product Details with (Add to cart - Rate System - Review System)
- Search with ability to Filter by (Category - Brand - Price Range)
- Cart Feature with (Stripe Payment)
- Order Status (In Progress - On The Way - Delivered)
- Favorite Feature (Realtime Updates)
- RealTime Chat Support (WebSocket)
- Push Notifications (Order Status Notification  - Chat Support Messages Notifications)
- Profile Feature (Upload Picture - Change Name - Change Email - Change Password)
- Set Location Feature with Places Search ( Google Maps )

## Prerequisites

Before running the app, ensure that you have the following:

- Android Studio (version 2022.2.1 or higher) or VS Code.
- Flutter 3.13 and Dart 3.0.6
- EFashion BackEnd : [E-Fashion-BackEnd Repository](https://github.com/Bit-Camp-IO/E-Fashion_BackEnd)

## Getting Started

To get started with the E-Fashion Flutter app, follow these steps:

1. Clone E-Fashion BackEnd Repository, and Follow their readme for setting it up [E-Fashion-BackEnd README](https://github.com/Bit-Camp-IO/E-Fashion_BackEnd/blob/main/README.md)
2. Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/Bit-Camp-IO/E-Fashion_Flutter.git
```

3. Open Android Studio and select "Open an Existing Project."
4. Navigate to the cloned project directory and select it.
5. Android Studio will build and sync the project automatically.
6. Once the project is synced run `flutter pub get`.
7. After the packages load successfully, navigate to the `lib` directory in the project.
8. Rename .env-example file to .env and open it, replace 'STRIPE_PUBLISHABLE_KEY' and 'GOOGLE_MAPS_KEY' with your keys
 ```xml
STRIPE_PUBLISHABLE_KEY='YOUR_STRIPE_KEY'
GOOGLE_MAPS_KEY = 'YOUR_GOOGLE_MAPS_KEY'
```
9. Open android => app => main => AndroidManifast.xml
Scroll to the end and look for `com.google.android.geo.API_KEY` and add your google maps key
 ```xml
<meta-data android:name="com.google.android.geo.API_KEY" android:value="YOUR_GOOGLE_MAPS_KEY"/>
```
10. Use Firebase Cli and connect the app to the same Firebase project that the backend use, make sure that Firebase_options.dart and google-services.json are created.
11. Go To  `lib\shared\constants` Open `api_constants.dart` and add the modify the following code
```xml
apiUrl = 'YOUR_BACK_END_URL';
```
12. Save the file.
13. Run the app on an emulator or physical device by clicking the "Run" button in Android Studio Or VS Code.

## Important Used Packages
 ```xml
- Flutter_Screen_Util
- Flutter_bloc
- Bloc_Concurrency
- RxDart
- Dartz
- Intl
- Firebase_Messaging
- Flutter_Local_Notifications
- Flutter_Hive
- Auto_Route
- Cached_Network_Image
- Google_Maps_Flutter
- Socket_IO_Client
- Permession_handeler
- Flutter_Stripe
- GetIt
- Injectable
- Image_Picker
```

## API Usage

The E-Fashion Flutter app utilizes the E-Fashion BackEnd API that empower all of the app's features. make sure to setup the backend server as mentioned in the prerequisites.

The API URL is stored in the `api_constants.dart` file as described in the "Getting Started" section. This apiUrl is used by the app to communicate with the api and the websockets server.

## Contributing

Contributions to the E-Fashion Flutter app are welcome! If you find any issues or want to add new features, please submit an issue or pull request on the GitHub repository.

When contributing, please adhere to the following guidelines:

- Fork the repository and create a new branch for your feature or bug fix.
- Ensure that your code follows the project's code style and conventions.
- Write clear and concise commit messages and provide a detailed description of your changes.
- Test your changes thoroughly before submitting a pull request.

## License

This project is licensed under the ![Apeache License](https://img.shields.io/github/license/Bit-Camp-IO/E-Fashion_Flutter). Feel free to use, modify, and distribute the code as per the terms of the license.

## Acknowledgments

The E-Fashion Flutter app is built upon E-Fashion BackEnd, which power the whole app's features

We would like to express our gratitude for our backend team for their efforts in this project.

## Contact

If you have any questions, suggestions, or feedback, please contact the project maintainer:

Email: momenmuhammad01@gmail.com\
GitHub: [Bit-Camp-IO](https://github.com/Bit-Camp-IO)

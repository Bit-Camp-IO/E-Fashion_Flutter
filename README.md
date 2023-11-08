# 📱 E-Fashion Flutter App
![Project Version](https://img.shields.io/badge/version-0.0.1-blue)
![GitHub license](https://img.shields.io/github/license/Bit-Camp-IO/E-Fashion_Flutter)
![GitHub last commit](https://img.shields.io/github/last-commit/Bit-Camp-IO/E-Fashion_Flutter)
![GitHub issues](https://img.shields.io/github/issues/Bit-Camp-IO/E-Fashion_Flutter)

This repository contains the source code for the E-Fashion Flutter App
This repository applies clean architecture packaging by component
The repository allows you to create a fashion store app with a lot of features.

📱 App Preview: [Watch On Youtube](https://www.youtube.com/watch?v=drZ33Vldnz8)
![eFashion in app preview](https://i.imgur.com/A43otzv.png)

## Features 🚀:

  ### Theming
  - Material 3 Support
  - ColorScheme System
  - Theme Switching (Light - Dark)
    
  ### Authentication
  - **Login**
  - **Register**
  - **Forget Password**: Allow users to reset their passwords using email-based one-time passwords (OTPs).
  
  ### Dynamic Home Feature
  - Collections
  - Offers
  - Brands
  - Discover(Brands - Products) *PAGINATED*
  - Filter and sort products by category, gender, price, and brand.
  - Easy Add To Cart option
  
  ### Product Details
  
  - View detailed information for each product, including images, description, price, and available sizes and colors.
  - Add or edit rating
  - Add or edit review
  
  ### Products Search
  - Search for a products by name.
  - Filter Search By (Category - Brand - Price Range)
  
  ### Favorites
  
  - Save favorite product to a favorites list to buy it later.
  
  ### Shopping Cart
  
  - Add products to a shopping cart.
  - Adjust product quantities and remove items from the cart.
  - Calculate the total order amount.
  
  ### Checkout and Payment with [Stripe](https://stripe.com/)
  
  - Secure and streamlined checkout process .
  - Multiple payment options (Credit/Debit Cards).
  
  ### User Profile
  
  - User profile with personal information like (Name - Picture - Email - Location - Order History)
  - Update user profile (Uploading new picture, Change (name, email, phone number, password, location))
  
  ### Order Tracking
  
  - Track the status of orders.
  - Receive real-time updates on order processing and shipping.
    
  ### Location **Google Maps**
  
  - Ability to set or change current locations
  - Search for a location
  - Search locations suggestions **Google Maps Places API** 
  - Set location marker
  
  ### Real-Time Chat with **WebSockets**
  
  - Real-time chat functionality for customer support using **WebSockets**. This feature fosters seamless communication between user and support.
  
  ###  Notifications 
  - **Notifications List**: A list showcasing recent received notifications
  - **Chat Support Push Notifications**: Receive a message push notifications whenever the user outside the support chat.
  - **Order Status Push Notifications**: Receive a push notifications for order status changes
  - **General Push Notifications**: Receive a Custom Push Notifications From the app


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
8. Rename `.example-env` file to `.env` and open it, replace 'STRIPE_PUBLISHABLE_KEY' and 'GOOGLE_MAPS_KEY' with your keys
 ```xml
STRIPE_PUBLISHABLE_KEY='YOUR_STRIPE_KEY'
GOOGLE_MAPS_KEY = 'YOUR_GOOGLE_MAPS_KEY'
```
9. Open android => app => main => AndroidManifest.xml, Scroll to the end and look for `com.google.android.geo.API_KEY`
and add your own google maps key
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
- Permission_handler
- Flutter_Stripe
- GetIt
- Injectable
- Image_Picker
```

## API Usage

The E-Fashion Flutter app utilizes the E-Fashion BackEnd API that empower all of the app's features. make sure to setup the backend server as mentioned in the prerequisites.

The API URL is stored in the `api_constants.dart` file as described in the "Getting Started" section. This apiUrl is used by the app to communicate with the api and the websockets server.

## Project Architecture Advantages
- Full independence from the presentation layer.
- improve maintainability, modularity, and testability.
- Bloc/Cubit can easily use several components without any restrictions unlike packaging by feature.
- No need for repeating usecases or entities or sharing them
- Project Structure Example :
 ```
Lib
├───components
│   ├───firstComponent
│   │   ├───data
│   │   │   ├───datasources
│   │   │   │   ├───local
│   │   │   │   └───remote
│   │   │   ├───models
│   │   │   └───repositories
│   │   └───domain
│   │       ├───entities
│   │       ├───repositories
│   │       └───usecases
├───presentation
│   ├───firstPersentation
│   │   ├───bloc
│   │   │   └───first_cubit
│   │   ├───components
│   │   │   └───firstComponent
│   │   └───screens
│   └───shared
│       ├───animations
│       ├───bloc
│       │   ├───shared_cubit
│       └───widgets
└───shared
    ├───api
    ├───constants
    ├───error
    ├───router
    ├───theme
    └───util
```

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

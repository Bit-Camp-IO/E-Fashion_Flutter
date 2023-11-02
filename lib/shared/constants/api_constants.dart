final class ApiConstants {
  //! Core
  static const String apiUrl = 'http://192.168.1.20:8080';
  static const String baseUrl = '$apiUrl/api';
  static const String mapsBaseUrl = 'https://maps.googleapis.com/maps/api';
  static const String unAuthenticatedConsumer = 'unAuthenticatedConsumer';
  static const String authenticatedConsumer = 'authenticatedConsumer';
  static const String mapsConsumerName = 'mapsApiConsumer';
  static const String headerContentType = 'Content-Type';
  static const String headerContentTypeValue = 'application/json';

  //! Auth EndPoints
  static const String authLoginEndPoint = '/auth/login';
  static const String authSignUpEndPoint = '/auth/register';
  static const String refreshAccessToken = '/auth/refresh';
  static const String forgetPasswordEndPoint = '/auth/forgot-password';
  static const String verifyPasswordOtpEndPoint = '/auth/verify-password-otp';
  static const String resetPasswordEndPoint = '/auth/reset-password';
  static const String changePasswordEndPoint = '/auth/change-password';

  //!Notifications End Points
  static const String getNotificationsList = '/notif/list';
  static const String subscribeToNotifications = '/notif/subscribe';
  static const String unsubscribeFromNotifications = '/notif/unsubscribe';

  //! Products End Points
  static const String categoriesEndPoint = '/category/list';
  static const String productsEndPoint = '/product/list';
  static const String brandsEndPoint = '/brand/list';

  static String productDetailsEndPoint({required String productId}) => '/product/$productId';
  static const String userFavoriteListEndPoint = '/user/favorites';

  static String productReviewsEndPoint({required String productId}) => '/product/$productId/rate';

  static String userReviewEndPoint({required String productId}) => '/product/$productId/rate/my-rating';

  //! Collection Endpoints
  static const String collectionsListEndPoint = '/collection';
  static String getCollectionItemsEndPoint({required String collectionId}) => '/collection/$collectionId';
  //! User EndPoints
  static const String userDataEndPoint = '/user/me';
  static const String editUserDataEndPoint = '/user/me/edit';
  static const String updateUserProfileEndPoint = '/user/profile-image';
  static String getUserProfilePicture({required String path}) => '$baseUrl/u/profile/$path';
  //! Cart
  static String cartEndPoint = '/user/cart';
  static String paymentIntentEndPoint = '/order/create-payment-intent';
  static const String ordersEndPoint = '/order';

  //! Maps EndPoints
  static const String mapPlaceAutoComplete = '/place/autocomplete/json';
  static const String mapPlaceDetails = '/place/details/json';
  static const String addressEndPoint = '/user/address';

  //! SupportChat EndPoints
  static const String getExistingChat = '/chat';
  static const String createNewChat = '/chat/new-chat';
  static String getChatMessages({required String chatId}) => '/chat/$chatId/messages';
  static String sendNewMessage({required String chatId}) => '/chat/$chatId/new-message';
}
enum ApiCallStatus{
  success('success'),
  error('error');
  const ApiCallStatus(this.value);
  final String value;
}
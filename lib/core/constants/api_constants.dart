final class ApiConstants {
  static const String baseUrl = 'https://e-fashionbackend-production.up.railway.app/api';
  static const String headerContentType = 'Content-Type';
  static const String headerContentTypeValue = 'application/json';
  static const String authLoginEndPoint = '/auth/login';
  static const String authSignUpEndPoint = '/auth/register';
  static const String refreshAccessToken = '/auth/refresh';
  static const String categoriesEndPoint = '/category/list';
  static const String productsEndPoint = '/product/list';
  static const String brandsEndPoint = '/brand/list';
  static const String productDetailsEndPoint = '/product/';
  static const String userFavoriteListEndPoint = '/user/favorites';
}

enum ApiCallStatus{
  success('success'),
  error('error');
  const ApiCallStatus(this.value);
  final String value;
}
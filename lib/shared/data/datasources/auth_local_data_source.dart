abstract class AuthLocalDataSource{
  Future<void> addAccessToken({required String accessToken});
  Future<void> addRefreshToken({required String accessToken});
  String getAccessToken();
  String getRefreshToken();
  Future<void> deleteRefreshToken();
  Future<void> deleteAccessToken();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource{
  @override
  Future<void> addAccessToken({required String accessToken}) {
    // TODO: implement addAccessToken
    throw UnimplementedError();
  }

  @override
  Future<void> addRefreshToken({required String accessToken}) {
    // TODO: implement addRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAccessToken() {
    // TODO: implement deleteAccessToken
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRefreshToken() {
    // TODO: implement deleteRefreshToken
    throw UnimplementedError();
  }

  @override
  String getAccessToken() {
    // TODO: implement getAccessToken
    throw UnimplementedError();
  }

  @override
  String getRefreshToken() {
    // TODO: implement getRefreshToken
    throw UnimplementedError();
  }
}
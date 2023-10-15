import 'package:dio/dio.dart';
import 'package:efashion_flutter/components/userComponent/data/models/user_model.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:injectable/injectable.dart';
import 'package:http_parser/http_parser.dart' as parser;

abstract class UserRemoteDataSource {
  Future<UserModel> getUserData({required String userAccessToken});

  Future<String> updateUserPicture({
    required String userAccessToken,
    required String imagePath,
    required String imageName,
  });

  Future<UserModel> updateUserData({
    required String userAccessToken,
    required String fullName,
    required String? phoneNumber,
    required String email,
  });
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final ApiConsumer _mainApiConsumer;

  UserRemoteDataSourceImpl(
      @Named(ApiConstants.mainConsumerName) this._mainApiConsumer);

  @override
  Future<UserModel> getUserData({required String userAccessToken}) async {
    final response = await _mainApiConsumer.get(ApiConstants.userDataEndPoint,
        headers: {'Authorization': 'Bearer $userAccessToken'});
    if (response['status'] == ApiCallStatus.success.value) {
      return UserModel.fromJson(response['data']);
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<String> updateUserPicture({
    required String userAccessToken,
    required String imagePath,
    required String imageName,
  }) async {
    final response = await _mainApiConsumer.post(
      ApiConstants.updateUserProfileEndPoint,
      headers: {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $userAccessToken',
      },
      body: FormData.fromMap(
        {
          'profile': await MultipartFile.fromFile(
            imagePath,
            filename: imageName,
            contentType: parser.MediaType('image', 'png'),
          ),
        },
      ),
    );
    if (response['status'] == ApiCallStatus.success.value) {
      return response['data']['path'];
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<UserModel> updateUserData({
    required String userAccessToken,
    required String fullName,
    required String? phoneNumber,
    required String email,
  }) async {
    final response = await _mainApiConsumer.patch(
      ApiConstants.editUserDataEndPoint,
      headers: {'Authorization': 'Bearer $userAccessToken'},
      body: phoneNumber != null ? {
        "email": email,
        "phoneNumber": phoneNumber,
        "fullName": fullName
      }: {
        "email": email,
        "fullName": fullName
      }
    );
    if (response['status'] == ApiCallStatus.success.value) {
      return UserModel.fromJson(response['data']);
    } else {
      throw const FetchDataException();
    }
  }
}

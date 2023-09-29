import 'package:efashion_flutter/components/userComponent/data/models/user_model.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:injectable/injectable.dart';

abstract class UserRemoteDataSource{
  Future<UserModel> getUserData({required String userAccessToken});
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl extends UserRemoteDataSource{
  final ApiConsumer _mainApiConsumer;
  UserRemoteDataSourceImpl(@Named(ApiConstants.mainConsumerName) this._mainApiConsumer);
  @override
  Future<UserModel> getUserData({required String userAccessToken}) async{
    final response = await _mainApiConsumer.get(ApiConstants.userDataEndPoint, headers: {
      'Authorization' : 'Bearer $userAccessToken'
    });
    if(response['status'] == ApiCallStatus.success.value){
      return UserModel.fromJson(response['data']);
    }else{
      throw const FetchDataException();
    }
  }
}
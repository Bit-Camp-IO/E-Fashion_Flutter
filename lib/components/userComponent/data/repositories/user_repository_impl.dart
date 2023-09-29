import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/userComponent/data/datasources/local/user_local_data_source.dart';
import 'package:efashion_flutter/components/userComponent/data/datasources/remote/user_remote_data_source.dart';
import 'package:efashion_flutter/components/userComponent/data/models/user_model.dart';
import 'package:efashion_flutter/components/userComponent/domain/entities/app_theme.dart';
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository{
  final UserLocalDataSource _userLocalDataSource;
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl(this._userLocalDataSource, this._userRemoteDataSource);
  @override
  AppTheme getAppTheme() {
    final appThemeModel = _userLocalDataSource.getAppTheme();
    return appThemeModel.toAppTheme();
  }

  @override
  Future<AppTheme> changeAppTheme(bool isDarkMode) async{
    final appThemeModel = await _userLocalDataSource.changeAppTheme(isDarkMode);
    return appThemeModel.toAppTheme();
  }

  @override
  Future<Either<Failure, UserModel>> getUserData({required String userAccessToken}) async{
    try{
      final UserModel userData = await _userRemoteDataSource.getUserData(userAccessToken: userAccessToken);
      return right(userData);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }
}
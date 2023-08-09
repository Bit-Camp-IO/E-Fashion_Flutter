import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dioClient => Dio();
}


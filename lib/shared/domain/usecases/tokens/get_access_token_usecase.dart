import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/shared/domain/repositories/tokens_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAccessTokenUseCase {
  final TokensRepository _tokensRepository;
  GetAccessTokenUseCase(this._tokensRepository);
  Future<Either<Failure,String>>  call() async{
    return await _tokensRepository.getAccessToken();
  }
}
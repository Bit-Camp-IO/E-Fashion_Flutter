import 'package:efashion_flutter/shared/domain/repositories/tokens_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteTokensUseCase{
  final TokensRepository _tokensRepository;

  DeleteTokensUseCase(this._tokensRepository);

  Future<void> call() async{
    return await _tokensRepository.deleteTokens();
  }
}

import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteTokensUseCase{
  final AuthRepository _authRepository;

  DeleteTokensUseCase(this._authRepository);

  Future<void> call() async{
    return await _authRepository.deleteTokens();
  }
}
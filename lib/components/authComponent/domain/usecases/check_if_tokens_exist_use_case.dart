import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CheckIfTokensExistUseCase {
  final AuthRepository _authRepository;

  CheckIfTokensExistUseCase(this._authRepository);

  bool call() {
    return _authRepository.checkIfTokensExist();
  }
}

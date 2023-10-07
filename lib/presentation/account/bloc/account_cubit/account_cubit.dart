import 'package:efashion_flutter/components/authComponent/domain/usecases/get_access_token_usecase.dart';
import 'package:efashion_flutter/components/userComponent/domain/entities/user.dart';
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_user_data_usecase.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'account_state.dart';

@injectable
class AccountCubit extends Cubit<AccountState> {
  final GetUserDataUseCase _getUserDataUseCase;
  final GetAccessTokenUseCase _getAccessTokenUseCase;

  late String userAccessToken;
  AccountCubit(this._getUserDataUseCase, this._getAccessTokenUseCase) : super(const AccountState());

  Future<void> getUserData() async {
    final getAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getAccessToken.getOrElse(() => '');
    final userData =
    await _getUserDataUseCase(userAccessToken: userAccessToken);
    userData.fold(
          (l) => null,
          (currentUserData) => emit(
        state.copyWith(userData: currentUserData),
      ),
    );
  }
}

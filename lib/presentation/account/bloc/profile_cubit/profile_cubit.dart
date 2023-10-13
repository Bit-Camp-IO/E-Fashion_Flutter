import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart';
import 'package:efashion_flutter/components/userComponent/domain/entities/user.dart';
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_user_data_usecase.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfiletState> {
  final GetUserDataUseCase _getUserDataUseCase;
  final GetUserAccessTokenUseCase _getAccessTokenUseCase;

  late String userAccessToken;
  ProfileCubit(this._getUserDataUseCase, this._getAccessTokenUseCase) : super(const ProfiletState());

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

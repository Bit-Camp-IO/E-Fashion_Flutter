part of 'account_cubit.dart';

class AccountState extends Equatable {
  final User userData;
  final String userDataLoadFailMessage;
  final BlocState userDataState;

  @override
  List<Object> get props => [
        userData,
        userDataLoadFailMessage,
        userDataState,
      ];

  const AccountState({
    this.userData = const User(
      email: '',
      fullName: '',
      profileImage: null,
    ),
    this.userDataLoadFailMessage = '',
    this.userDataState = BlocState.initial,
  });

  AccountState copyWith({
    User? userData,
    String? userDataLoadFailMessage,
    BlocState? userDataState,
  }) {
    return AccountState(
      userData: userData ?? this.userData,
      userDataLoadFailMessage:
          userDataLoadFailMessage ?? this.userDataLoadFailMessage,
      userDataState: userDataState ?? this.userDataState,
    );
  }
}

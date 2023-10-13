part of 'profile_cubit.dart';

class ProfiletState extends Equatable {
  final User userData;
  final String userDataLoadFailMessage;
  final BlocState userDataState;

  @override
  List<Object> get props => [
        userData,
        userDataLoadFailMessage,
        userDataState,
      ];

  const ProfiletState({
    this.userData = const User(
      email: '',
      fullName: '',
      profileImage: null,
    ),
    this.userDataLoadFailMessage = '',
    this.userDataState = BlocState.initial,
  });

  ProfiletState copyWith({
    User? userData,
    String? userDataLoadFailMessage,
    BlocState? userDataState,
  }) {
    return ProfiletState(
      userData: userData ?? this.userData,
      userDataLoadFailMessage:
          userDataLoadFailMessage ?? this.userDataLoadFailMessage,
      userDataState: userDataState ?? this.userDataState,
    );
  }
}

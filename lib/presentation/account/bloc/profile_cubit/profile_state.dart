part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final User userData;
  final String userDataLoadFailMessage;
  final CubitState userDataState;
  final String updateProfilePictureFailMessage;
  final CubitState updateProfilePictureState;

  @override
  List<Object> get props => [
        userData,
        userDataLoadFailMessage,
        userDataState,
        updateProfilePictureFailMessage,
        updateProfilePictureState,
      ];

  const ProfileState({
    this.userData = const User(
      id: '',
      email: '',
      fullName: '',
      phoneNumber: '',
      profileImagePath: null,
    ),
    this.userDataLoadFailMessage = '',
    this.userDataState = CubitState.initial,
    this.updateProfilePictureFailMessage = '',
    this.updateProfilePictureState = CubitState.initial,
  });

  ProfileState copyWith({
    User? userData,
    String? userDataLoadFailMessage,
    CubitState? userDataState,
    String? updateProfilePictureFailMessage,
    CubitState? updateProfilePictureState,
    String? userId,
  }) {
    return ProfileState(
      userData: userData ?? this.userData,
      userDataLoadFailMessage: userDataLoadFailMessage ?? this.userDataLoadFailMessage,
      userDataState: userDataState ?? this.userDataState,
      updateProfilePictureFailMessage: updateProfilePictureFailMessage ?? this.updateProfilePictureFailMessage,
      updateProfilePictureState: updateProfilePictureState ?? this.updateProfilePictureState,
    );
  }
}

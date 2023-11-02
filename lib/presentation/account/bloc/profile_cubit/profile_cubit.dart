import 'package:efashion_flutter/components/userComponent/domain/entities/user.dart';
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_user_data_usecase.dart';
import 'package:efashion_flutter/components/userComponent/domain/usecases/update_profile_picture_usecase.dart';
import 'package:efashion_flutter/components/userComponent/domain/usecases/update_user_data_usecase.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetUserDataUseCase _getUserDataUseCase;
  final UpdateProfilePictureUseCase _updateProfilePictureUSeCase;
  final UpdateUserDataUseCase _updateUserDataUseCase;
  final ImagePicker imagePicker = ImagePicker();

  ProfileCubit(
    this._getUserDataUseCase,
    this._updateProfilePictureUSeCase,
    this._updateUserDataUseCase,
  ) : super(const ProfileState());

  Future<void> getUserData() async {
    final userData = await _getUserDataUseCase();
    userData.fold(
      (failure) => emit(
        state.copyWith(
          userDataLoadFailMessage: failure.message,
          userDataState: CubitState.failure,
        ),
      ),
      (currentUserData) => emit(
        state.copyWith(
          userData: currentUserData,
        ),
      ),
    );
  }

  Future<XFile?> _pickImageFromGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image;
    } else {
      return null;
    }
  }

  Future<void> updateProfilePicture() async {
    emit(state.copyWith(updateProfilePictureState: CubitState.loading));
    final pickedImage = await _pickImageFromGallery();
    if (pickedImage != null) {
      final response = await _updateProfilePictureUSeCase(
        imageName: pickedImage.name,
        imagePath: pickedImage.path,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            updateProfilePictureFailMessage: failure.message,
            updateProfilePictureState: CubitState.failure,
          ),
        ),
        (updatedImagePath) => emit(
          state.copyWith(
            userData: state.userData.copyWith(profileImagePath: updatedImagePath),
            updateProfilePictureState: CubitState.success,
          ),
        ),
      );
    }
  }

  Future<void> updateUserData({
    required String? fullName,
    required String? phoneNumber,
    required String? email,
  }) async {
    emit(state.copyWith(userDataState: CubitState.loading));
    final userData = await _updateUserDataUseCase(
      phoneNumber: phoneNumber ?? state.userData.phoneNumber,
      email: email ?? state.userData.email,
      fullName: fullName ?? state.userData.fullName,
    );
    userData.fold(
      (failure) => emit(
        state.copyWith(
          userDataLoadFailMessage: failure.message,
          userDataState: CubitState.failure,
        ),
      ),
      (updatedUserData) => emit(
        state.copyWith(
          userData: updatedUserData,
          userDataState: CubitState.success,
        ),
      ),
    );
  }
}

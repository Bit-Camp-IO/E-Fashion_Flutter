import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/account/bloc/profile_cubit/profile_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/container_button.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_snack_bar.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_text_form_field.dart';
import 'package:efashion_flutter/presentation/shared/widgets/secondary_button.dart';
import 'package:efashion_flutter/presentation/account/components/shared/account_clipped_container.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:efashion_flutter/shared/util/validation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileContainerComponent extends StatefulWidget {
  const EditProfileContainerComponent({super.key});

  @override
  State<EditProfileContainerComponent> createState() =>
      _EditProfileContainerComponentState();
}

class _EditProfileContainerComponentState
    extends State<EditProfileContainerComponent> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  String? _fullName;
  String? _phoneNumber;
  String? _email;
  late final ProfileCubit profileCubit;
  bool isLoading = false;

  @override
  void initState() {
    profileCubit = context.read<ProfileCubit>();
    _formKey = GlobalKey<FormState>();
    _nameController =
        TextEditingController(text: profileCubit.state.userData.fullName);
    if (profileCubit.state.userData.phoneNumber != null) {
      _phoneController =
          TextEditingController(text: profileCubit.state.userData.phoneNumber);
    } else {
      _phoneController = TextEditingController();
    }

    _emailController =
        TextEditingController(text: profileCubit.state.userData.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AccountClippedContainer(
        height: FocusScope.of(context).hasPrimaryFocus || !FocusScope.of(context).hasFocus
            ? 500.h
            : 410.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              ClippedContainerButton(
                onTap: () {
                  context.popRoute();
                },
                icon: Iconsax.arrow_left,
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Text(
                  "Edit Profile",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextFormField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                prefixIcon: Iconsax.user,
                label: "Name",
                borderRadius: (12.0).r,
                onSaved: (value) {
                  if (value != null && value != profileCubit.state.userData.fullName) {
                    _fullName = value;
                    debugPrint(_fullName);
                  }
                },
              ),
              CustomTextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                prefixIcon: Iconsax.call,
                label: "Phone Number",
                borderRadius: (12.0).r,
                onSaved: (value) {
                  if (value!.isNotEmpty && value != profileCubit.state.userData.phoneNumber) {
                    _phoneNumber = value;
                    debugPrint(_phoneNumber);
                  }
                },
                validator: ValidationManager.phoneNumberValidator(phoneController: _phoneController)
              ),
              CustomTextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                label: "Email",
                borderRadius: (12.0).r,
                onSaved: (value) {
                  if (value != null &&
                      value != profileCubit.state.userData.email) {
                    _email = value;
                    debugPrint(_email);
                  }
                },
              ),
              Center(
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    if(state.userDataState == CubitState.loading){
                      isLoading = true;
                    }else if (state.userDataState == CubitState.success){
                      ScaffoldMessenger.of(context).showSnackBar(
                        CustomSnackBar.show(
                          customSnackBarType: CustomSnackBarType.success,
                          message: StringsManager.profileInfoUpdated,
                          context: context,
                        ),
                      );
                      context.popRoute();
                      isLoading = false;
                    }
                  },
                  builder: (context, state) {
                    return SecondaryButton(
                      buttonTitle: 'Update',
                      width: 150.w,
                      height: 42.h,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      isLoading: isLoading,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if (_fullName != null || _phoneNumber != null ||
                              _email != null) {
                            context.read<ProfileCubit>().updateUserData(
                              fullName: _fullName,
                              phoneNumber: _phoneNumber,
                              email: _email,
                            );
                          }
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

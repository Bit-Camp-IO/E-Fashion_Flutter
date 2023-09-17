import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/shared/widgets/container_button.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_text_form_field.dart';
import 'package:efashion_flutter/presentation/shared/widgets/secondary_button.dart';
import 'package:efashion_flutter/presentation/account/components/shared/account_clipped_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ChangePasswordContainerComponent extends StatefulWidget {
  const ChangePasswordContainerComponent({super.key});

  @override
  State<ChangePasswordContainerComponent> createState() =>
      _ChangePasswordContainerComponentState();
}

class _ChangePasswordContainerComponentState
    extends State<ChangePasswordContainerComponent> {
  late GlobalKey<FormState> _formKey;
  late String currentPassword;
  late String newPassword;
  late String confirmPassword;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AccountClippedContainer(
        height: FocusScope.of(context).hasPrimaryFocus ||
                !FocusScope.of(context).hasFocus
            ? 520.h
            : 430.h,
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
                  "Change Password",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.text,
                prefixIcon: Iconsax.lock,
                label: "Current Password",
                obscureText: true,
                onSaved: (value) {
                  if (value != null) {
                    currentPassword = value;
                    debugPrint(currentPassword);
                  }
                },
              ),
              CustomTextFormField(
                keyboardType: TextInputType.text,
                prefixIcon: Iconsax.lock_1,
                label: "New Password",
                obscureText: true,
                onSaved: (value) {
                  if (value != null) {
                    newPassword = value;
                    debugPrint(newPassword);
                  }
                },
              ),
              CustomTextFormField(
                keyboardType: TextInputType.text,
                prefixIcon: Iconsax.lock_1,
                label: "Confirm Password",
                obscureText: true,
                onSaved: (value) {
                  if (value != null) {
                    confirmPassword = value;
                    debugPrint(confirmPassword);
                  }
                },
              ),
              Center(
                child: SecondaryButton(
                  buttonTitle: 'Done',
                  width: 100.w,
                  height: 42.h,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
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
    super.dispose();
  }
}

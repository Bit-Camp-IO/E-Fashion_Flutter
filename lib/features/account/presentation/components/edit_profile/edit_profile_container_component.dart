import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/util/size_manager.dart';
import 'package:efashion_flutter/core/widgets/container_button.dart';
import 'package:efashion_flutter/core/widgets/custom_text_form_field.dart';
import 'package:efashion_flutter/core/widgets/secondary_button.dart';
import 'package:efashion_flutter/features/account/presentation/components/shared/account_clipped_container.dart';
import 'package:flutter/material.dart';
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
  late GlobalKey<FormState> formKey;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late String name;
  late String phoneNumber;
  late String email;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController(text: 'Tara Slander');
    phoneController = TextEditingController(text: '+1 2018577757');
    emailController = TextEditingController(text: 'taraslan127@gmail.com');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AccountClippedContainer(
        height: FocusScope.of(context).hasPrimaryFocus ||
                !FocusScope.of(context).hasFocus
            ? SizeManager.screenHeight * 0.65
            : SizeManager.screenHeight * 0.55,
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
                controller: nameController,
                type: TextInputType.text,
                prefixIcon: Iconsax.user,
                label: "Name",
                borderRadius: (12.0).r,
                onSaved: (value) {
                  if(value != null){
                    name = value;
                    debugPrint(name);
                  }
                },
              ),
              CustomTextFormField(
                controller: phoneController,
                type: TextInputType.number,
                prefixIcon: Iconsax.call,
                label: "Phone Number",
                borderRadius: (12.0).r,
                onSaved: (value) {
                  if(value != null){
                    phoneNumber = value;
                    debugPrint(phoneNumber);
                  }
                },
              ),
              CustomTextFormField(
                controller: emailController,
                type: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                label: "Email",
                borderRadius: (12.0).r,
                onSaved: (value) {
                  if(value != null){
                    email = value;
                    debugPrint(email);
                  }
                },
              ),
              Center(
                child: SecondaryButton(
                  buttonTitle: 'Done',
                  width: 100.w,
                  height: 42.h,
                  onTap: () {
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
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
    formKey.currentState?.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
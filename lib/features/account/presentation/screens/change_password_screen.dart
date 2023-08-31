import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/core/widgets/blurred_background_image.dart';
import 'package:efashion_flutter/core/widgets/custom_text_form_field.dart';
import 'package:efashion_flutter/core/widgets/secondary_button.dart';
import 'package:efashion_flutter/features/account/presentation/components/shared/account_skew_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BlurredBackgroundImage(
            imageUrl:
            "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 62.0,
            child: Column(
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                    "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
                    width: 120.w,
                    height: 120.h,
                  ),
                ),

              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: _focusNode.hasPrimaryFocus || !FocusScope.of(context).hasFocus  ? 0.70 : 0.84,
            minChildSize: _focusNode.hasPrimaryFocus || !FocusScope.of(context).hasFocus  ? 0.70 : 0.84,
            maxChildSize: _focusNode.hasPrimaryFocus || !FocusScope.of(context).hasFocus  ? 0.70 : 0.84,
            builder: (context, scrollController) => ClipPath(
              clipper: AccountSkewClipper(),
              child: Container(
                color: Theme.of(context).colorScheme.onInverseSurface,
                height: MediaQuery.sizeOf(context).height * 0.75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
                  child: ListView(
                    controller: scrollController,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            context.popRoute();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 10.0).r,
                            width: 48.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 64.h,
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
                        type: TextInputType.text,
                        prefixIcon: Iconsax.lock,
                        label: "Current Password",
                        borderRadius: (12.0).r,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        type: TextInputType.text,
                        prefixIcon: Iconsax.lock_1,
                        label: "New Password",
                        borderRadius: (12.0).r,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        type: TextInputType.text,
                        prefixIcon: Iconsax.lock_1,
                        label: "Confirm Password",
                        borderRadius: (12.0).r,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Center(
                        child: SecondaryButton(
                          buttonTitle: 'Done',
                          width: 100.w,
                          height: 42.h,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}

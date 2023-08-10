import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.type,
    required this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    required this.label,
    this.onPressedSuffix,
    this.hintText,
    this.onSubmit,
  });

  final TextEditingController controller;
  final TextInputType type;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final String label;
  final Function(String)? onSubmit;
  final VoidCallback? onPressedSuffix;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: onPressedSuffix,
        ),
        label: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        contentPadding: const EdgeInsets.all(15.0).r,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0).r,
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0).r,
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return '$label required';
        }
        return null;
      },
    );
  }
}

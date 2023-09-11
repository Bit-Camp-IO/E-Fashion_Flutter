import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.label,
    this.onSuffixPress,
    this.hintText,
    this.onSubmit,
    this.borderRadius,
    this.enableBorderColor,
    this.onSaved,
    this.validator,
    this.textFieldHeight = 70,
    this.boxConstraints,
  });

  final TextEditingController? controller;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final String? label;
  final Function(String submittedText)? onSubmit;
  final Function(String? value)? onSaved;
  final VoidCallback? onSuffixPress;
  final String? hintText;
  final double? borderRadius;
  final Color? enableBorderColor;
  final FormFieldValidator? validator;
  final double? textFieldHeight;
  final BoxConstraints? boxConstraints;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool? _obscuredText;

  @override
  void initState() {
    if (widget.obscureText == true) {
      _obscuredText = widget.obscureText!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4).r,
      child: SizedBox(
        height: widget.textFieldHeight ?? 75.h,
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: _obscuredText ?? false,
          onSaved: widget.onSaved,
          onFieldSubmitted: widget.onSubmit,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
          decoration: InputDecoration(
            errorStyle: Theme.of(context).textTheme.bodySmall,
            constraints: widget.boxConstraints ?? BoxConstraints(
                maxHeight: 46.h,
                maxWidth: 312.w
            ),
            hintText: widget.hintText,
            errorMaxLines: 1,
            prefixIcon: widget.prefixIcon == null
                ? null
                : Icon(
                    widget.prefixIcon,
              size: 20.sp,
                  ),
            suffixIcon: _buildSuffix(),
            labelText: widget.label,
            labelStyle: Theme.of(context).textTheme.bodySmall,
            contentPadding: const EdgeInsets.all(15.0).r,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0).r,
              borderSide: BorderSide(
                color: widget.enableBorderColor ??
                    Theme.of(context).colorScheme.outline,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0).r,
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0).r,
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0).r,
              borderSide: BorderSide(
                color: widget.enableBorderColor ??
                    Theme.of(context).colorScheme.outline,
              ),
            ),
          ),
          validator: widget.validator ??
              _buildValidator()
        ),
      ),
    );
  }

  _buildValidator() {
    if (widget.keyboardType == TextInputType.emailAddress) {
      return (value) {
        final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
        if (!emailRegex.hasMatch(value ?? '')) {
          return 'Not a valid email address';
        }
        return null;
      };
    } else {
      return (value) {
        if (value!.isEmpty) {
          return '${widget.label} is required';
        } else if (value.length < 8) {
          return '${widget.label} is too short';
        }
        return null;
      };
    }
  }

  Widget? _buildSuffix() {
    if (_obscuredText != null) {
      return IconButton(
        icon: Icon(_buildSuffixIcon(), size: 20.sp,),
        onPressed: () {
          if (_obscuredText != null) {
            setState(() {
              _obscuredText = !_obscuredText!;
            });
          }
          widget.onSuffixPress;
        },
      );
    } else if (widget.suffixIcon != null) {
      return Icon(widget.suffixIcon, size: 20.sp,);
    } else {
      return null;
    }
  }

  IconData? _buildSuffixIcon() {
    if (_obscuredText == true) {
      return Iconsax.eye;
    } else {
      return Iconsax.eye_slash;
    }
  }
}

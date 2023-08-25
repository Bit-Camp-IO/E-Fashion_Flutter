import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewTextField extends StatelessWidget {
  const ReviewTextField({super.key, required this.onSaved});
  final FormFieldSetter onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.start,
      maxLength: 200,
      maxLines: 4,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      validator: (value) {
        if(value!.length < 50){
          return "The review must be at least 50 Characters.";
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Describe your opinion',
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Theme.of(context).colorScheme.outline,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          borderRadius: BorderRadius.circular(10).r,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(10).r,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(10).r,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(10).r,
        ),
      ),
    );
  }
}

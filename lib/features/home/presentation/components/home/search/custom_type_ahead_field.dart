// ignore_for_file: unused_field

import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:iconsax/iconsax.dart';

class CustomTypeAheadField extends StatefulWidget {
  const CustomTypeAheadField(
      {super.key, required this.suggestionCallback, required this.onChanged});

  final SuggestionsCallback suggestionCallback;
  final ValueChanged<String> onChanged;

  @override
  State<CustomTypeAheadField> createState() => _CustomTypeAheadFieldState();
}

class _CustomTypeAheadFieldState extends State<CustomTypeAheadField> {
  final TextEditingController _typeAheadController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late String _selectedProduct;
  bool isFocused = false;

  void _onFocusChange() {
    setState(() {
      isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void initState() {
    _focusNode.addListener(_onFocusChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      animationDuration: const Duration(milliseconds: 300),
      minCharsForSuggestions: 1,
      itemSeparatorBuilder: (context, index) {
        return SizedBox(height: 24.h);
      },
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        constraints: BoxConstraints(
          minWidth: 312.w,
          maxWidth: 312.w,
          minHeight: 216.h,
          maxHeight: 216.h,
        ),
        elevation: 0,
        hasScrollbar: false,
        borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(10).r,
            bottomRight: const Radius.circular(10).r),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      textFieldConfiguration: TextFieldConfiguration(

        focusNode: _focusNode,
        enableInteractiveSelection: true,
        enabled: true,
        decoration: InputDecoration(
          constraints: BoxConstraints(
            minWidth: 312.w,
            maxWidth: 312.w,
            minHeight: 56.h,
            maxHeight: 56.h,
          ),
          prefixIcon: const Icon(Iconsax.search_normal_1),
          suffixIcon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isFocused
                ? IconButton(
                    key: ValueKey<bool>(isFocused),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                    },
                    icon: const Icon(Icons.close),
                  )
                : IconButton(
                    key: ValueKey<bool>(isFocused),
                    onPressed: () {
                      context.pushRoute(const SearchFilterRoute());
                    },
                    icon: const Icon(Iconsax.filter_search),
                  ),
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surfaceVariant,
          hintText: 'Search...',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              const Radius.circular(10).r,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.only(
              topRight: const Radius.circular(10).r,
              topLeft: const Radius.circular(10).r,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.only(
              topRight: const Radius.circular(10).r,
              topLeft: const Radius.circular(10).r,
            ),
          ),
        ),
        controller: _typeAheadController,
        onChanged: widget.onChanged,
      ),
      suggestionsCallback: widget.suggestionCallback,
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion.productName),
        );
      },
      transitionBuilder: (context, suggestionsBox, controller) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: controller!,
            curve: Curves.easeInOut,
          ),
          child: suggestionsBox,
        );
      },
      onSuggestionSelected: (suggestion) {
        _typeAheadController.text = suggestion.productName;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Search Can\'t be empty';
        } else {
          return '';
        }
      },
      onSaved: (value) => _selectedProduct = value!,
    );
  }
}

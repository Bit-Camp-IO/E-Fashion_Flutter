import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearchField extends StatefulWidget {

  final ValueChanged<String> onChanged;
  final void Function() onFilterTap;
  const CustomSearchField({super.key, required this.onChanged, required this.onFilterTap,});


  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  ValueNotifier<bool> isFocused = ValueNotifier(false);

  void _onFocusChange() {
      isFocused.value = _focusNode.hasFocus;
  }

  @override
  void initState() {
    _focusNode.addListener(_onFocusChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312.w,
      height: 65.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20).r),
      child: ValueListenableBuilder(
        valueListenable: isFocused,
        builder: (context, isFocusedValue, child) => TextFormField(
          focusNode: _focusNode,
          enableInteractiveSelection: true,
          enabled: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.search_normal_1),
            suffixIcon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isFocusedValue
                  ? IconButton(
                      key: ValueKey<bool>(isFocusedValue),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                      },
                      icon: const Icon(Icons.close),
                    )
                  : IconButton(
                      key: ValueKey<bool>(isFocusedValue),
                      onPressed: widget.onFilterTap,
                      icon: const Icon(Iconsax.filter_search),
                    ),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceVariant,
            hintText: StringsManager.searchHint,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                const Radius.circular(10).r,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                const Radius.circular(10).r,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                const Radius.circular(10).r,
              ),
            ),
          ),
          controller: _textEditingController,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
  @override
  void dispose() {
    _textEditingController.dispose();
    isFocused.dispose();
    _focusNode..removeListener(_onFocusChange)..dispose();
    super.dispose();
  }
}

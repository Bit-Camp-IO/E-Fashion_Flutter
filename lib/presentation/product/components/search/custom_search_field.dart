import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField(
      {super.key, required this.onChanged, required this.onFilterTap});

  final ValueChanged<String> onChanged;
  final void Function() onFilterTap;

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
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
    return Container(
      width: 312.w,
      height: 65.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20).r),
      child: TextFormField(
        focusNode: _focusNode,
        enableInteractiveSelection: true,
        enabled: true,
        decoration: InputDecoration(
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
                    onPressed: widget.onFilterTap,
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
    );
  }
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}

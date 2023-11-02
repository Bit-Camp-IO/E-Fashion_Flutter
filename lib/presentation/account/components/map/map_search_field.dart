import 'package:efashion_flutter/components/mapComponent/domain/entities/place.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/shared/util/size_manager.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class MapSearchField extends StatefulWidget {

  final ValueChanged<String> onChanged;
  final List<Place> places;
  final void Function(String placeId) onPlaceChoose;
  const MapSearchField({super.key, required this.onChanged, required this.places, required this.onPlaceChoose,});

  @override
  State<MapSearchField> createState() => _MapSearchFieldState();
}

class _MapSearchFieldState extends State<MapSearchField> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeManager.screenHeight * 0.4,
      child: Column(
        children: [
          SizedBox(
            width: 312.w,
            child: TextFormField(
              onTap: () {
                _controller.clear();
              },
              onTapOutside: (event) => _focusNode.unfocus(),
              focusNode: _focusNode,
              controller: _controller,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.search_normal_1),
                suffixIcon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _focusNode.hasPrimaryFocus
                      ? IconButton(
                          key: ValueKey<bool>(_focusNode.hasPrimaryFocus),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                          },
                          icon: const Icon(Icons.close),
                        )
                      : const SizedBox.shrink(),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceVariant,
                hintText: StringsManager.searchHint,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
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
            ),
          ),
          _focusNode.hasPrimaryFocus || _focusNode.hasFocus && widget.places.isNotEmpty
              ? Expanded(
                  child: CustomFadeAnimation(
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      width: 312.w,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.only(
                          bottomRight: const Radius.circular(10).r,
                          bottomLeft: const Radius.circular(10).r,
                        ),
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: widget.places.length,
                        itemBuilder: (context, index) {
                          return CustomFadeAnimation(
                            duration: const Duration(milliseconds: 300),
                            child: ListTile(
                              leading: const Icon(Iconsax.location),
                              title: Text(widget.places[index].name),
                              onTap: () {
                                _controller.text = widget.places[index].name;
                                widget.onPlaceChoose(widget.places[index].id);
                                _focusNode.unfocus();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

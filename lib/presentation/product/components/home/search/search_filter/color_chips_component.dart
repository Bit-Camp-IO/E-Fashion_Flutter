import 'package:efashion_flutter/presentation/product/components/home/search/search_filter/filter_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorChipsComponent extends StatefulWidget {
  const ColorChipsComponent({
    super.key,
    required this.colors,
    required this.selectedColors,
  });

  final List colors;
  final void Function(List listOfColors) selectedColors;

  @override
  State<ColorChipsComponent> createState() => _ColorChipsComponentState();
}

class _ColorChipsComponentState extends State<ColorChipsComponent> {
  List<String> colorChips = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FilterSection(title: 'Colors'),
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            spacing: 4.r,
            direction: Axis.horizontal,
            runSpacing: 4.r,
            children: List.generate(
              widget.colors.length,
              (index) => ChoiceChip(
                label: Text(
                  widget.colors[index].colorName,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                showCheckmark: false,
                avatar: Container(
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.colors[index].color,
                  ),
                ),
                backgroundColor: Colors.transparent,
                selectedColor: Colors.transparent,
                disabledColor: Colors.transparent,
                side: BorderSide(
                  color: colorChips.contains(widget.colors[index].colorName)
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                  width: colorChips.contains(widget.colors[index].colorName) ? 2 : 1,
                ), // Add
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20).r,
                ),
                selected: colorChips.contains(widget.colors[index].colorName),
                onSelected: (isChipSelected) {
                  setState(() {
                    if (colorChips.contains(widget.colors[index].colorName)) {
                      colorChips.removeWhere(
                          (element) => element == widget.colors[index].colorName);
                      widget.selectedColors(colorChips);
                    } else {
                      colorChips.add(widget.colors[index].colorName);
                      widget.selectedColors(colorChips);
                    }
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

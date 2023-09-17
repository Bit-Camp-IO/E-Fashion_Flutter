import 'package:efashion_flutter/presentation/product/components/home/search/search_filter/filter_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeChipsComponent extends StatefulWidget {
  const SizeChipsComponent({
    super.key,
    required this.sizes,
    required this.selectedSizes,
  });

  final List sizes;
  final void Function(List listOfSizes) selectedSizes;

  @override
  State<SizeChipsComponent> createState() => _SizeChipsComponentState();
}

class _SizeChipsComponentState extends State<SizeChipsComponent> {
  List<String> sizeChips = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FilterSection(title: 'Size'),
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            spacing: 4.r,
            direction: Axis.horizontal,
            runSpacing: 4.r,
            children: List.generate(
              widget.sizes.length,
              (index) => ChoiceChip(
                label: Text(
                  widget.sizes[index],
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                showCheckmark: false,
                avatar: Container(
                  width: 16.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: sizeChips.contains(widget.sizes[index]) ?  Colors.transparent : Theme.of(context).colorScheme.outline,
                    ),
                    color: sizeChips.contains(widget.sizes[index])
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                  ),
                  child: sizeChips.contains(widget.sizes[index])
                      ? const Icon(Icons.check, color: Colors.white, size: 12,)
                      : const SizedBox.shrink(),
                ),
                backgroundColor: Colors.transparent,
                selectedColor: Colors.transparent,
                disabledColor: Colors.transparent,
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20).r,
                ),
                selected: sizeChips.contains(widget.sizes[index]),
                onSelected: (isChipSelected) {
                  setState(() {
                    if (sizeChips.contains(widget.sizes[index])) {
                      sizeChips.removeWhere(
                          (element) => element == widget.sizes[index]);
                      widget.selectedSizes(sizeChips);
                    } else {
                      sizeChips.add(widget.sizes[index]);
                      widget.selectedSizes(sizeChips);
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

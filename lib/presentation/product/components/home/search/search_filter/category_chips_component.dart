import 'package:efashion_flutter/presentation/product/components/home/search/search_filter/filter_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryChipsComponent extends StatefulWidget {
  const CategoryChipsComponent({super.key, required this.categories, required this.selectedCategories, });
  final List categories;
  final void Function(List listOfCategories) selectedCategories;
  
  @override
  State<CategoryChipsComponent> createState() => _CategoryChipsComponentState();
}

class _CategoryChipsComponentState extends State<CategoryChipsComponent> {
  List<String> categoriesChips = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FilterSection(title: 'Category'),
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            spacing: 4.r,
            direction: Axis.horizontal,
            runSpacing: 4.r,
            children: List.generate(
              widget.categories.length,
                  (index) => ChoiceChip(
                label: Text(
                  widget.categories[index].filterName,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20).r,
                  // Adjust the radius as needed
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ), // Add an optional border
                ),
                selected: categoriesChips.contains(widget.categories[index].filterName),
                onSelected: (isChipSelected) {
                  setState(() {
                    if (categoriesChips.contains(widget.categories[index].filterName)) {
                      categoriesChips.removeWhere((element) => element == widget.categories[index].filterName);
                      widget.selectedCategories(categoriesChips);
                    } else {
                      categoriesChips.add(widget.categories[index].filterName);
                      widget.selectedCategories(categoriesChips);
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

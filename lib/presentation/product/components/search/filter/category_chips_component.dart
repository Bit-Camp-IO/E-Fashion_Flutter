import 'package:efashion_flutter/components/productComponent/domain/entities/category.dart';
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/search/filter/filter_section.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryChipsComponent extends StatefulWidget {
  const CategoryChipsComponent({
    super.key,
    required this.categories,
    required this.selectedCategories,
  });

  final List<Category> categories;
  final void Function(List listOfCategories) selectedCategories;

  @override
  State<CategoryChipsComponent> createState() => _CategoryChipsComponentState();
}

class _CategoryChipsComponentState extends State<CategoryChipsComponent> {
  List<String> categoriesChips = [];

  @override
  void initState() {
    SearchBloc searchBloc = context.read<SearchBloc>();
    if (searchBloc.categories != null) {
      categoriesChips = searchBloc.categories!
          .split(',')
          .map((category) => category)
          .toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FilterSection(title: StringsManager.categoriesFilterTitle),
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            spacing: 2.r,
            direction: Axis.horizontal,
            runSpacing: 4.r,
            children: List.generate(
              widget.categories.length,
              (index) => ChoiceChip(
                label: Text(
                  widget.categories[index].name,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                showCheckmark: false,
                avatar: Container(
                  width: 16.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          categoriesChips.contains(widget.categories[index].id)
                              ? Colors.transparent
                              : Theme.of(context).colorScheme.outline,
                    ),
                    color: categoriesChips.contains(widget.categories[index].id)
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                  ),
                  child: categoriesChips.contains(widget.categories[index].id)
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 12.sp,
                        )
                      : const SizedBox.shrink(),
                ),
                backgroundColor: Colors.transparent,
                selectedColor: Colors.transparent,
                disabledColor: Colors.transparent,
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1.w,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20).r,
                ),
                selected: categoriesChips.contains(widget.categories[index].id),
                onSelected: (isChipSelected) {
                  setState(() {
                    if (categoriesChips.contains(widget.categories[index].id)) {
                      categoriesChips.removeWhere(
                          (element) => element == widget.categories[index].id);
                      widget.selectedCategories(categoriesChips);
                    } else {
                      categoriesChips.add(widget.categories[index].id);
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

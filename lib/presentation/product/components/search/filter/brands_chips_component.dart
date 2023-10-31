import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/search/filter/filter_section.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsChipsComponent extends StatefulWidget {
  const BrandsChipsComponent({
    super.key,
    required this.brands,
    required this.selectedBrands,
  });

  final List<Brand> brands;
  final void Function(List listOfColors) selectedBrands;

  @override
  State<BrandsChipsComponent> createState() => _BrandsChipsComponentState();
}

class _BrandsChipsComponentState extends State<BrandsChipsComponent> {
  List<String> brandChips = [];

  @override
  void initState() {
    SearchBloc searchBloc = context.read<SearchBloc>();
    if(searchBloc.brands != null){
      brandChips = searchBloc.brands!.split(',').map((brand) => brand).toList();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FilterSection(title: StringsManager.brandsFilterTitle),
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            spacing: 4.r,
            direction: Axis.horizontal,
            runSpacing: 4.r,
            children: List.generate(
              widget.brands.length,
              (index) => ChoiceChip(
                label: Text(
                  widget.brands[index].name,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                showCheckmark: false,
                backgroundColor: Colors.transparent,
                selectedColor: Colors.transparent,
                disabledColor: Colors.transparent,
                side: BorderSide(
                  color: brandChips.contains(widget.brands[index].id)
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                  width: brandChips.contains(widget.brands[index].id) ? 2 : 1,
                ), // Add
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20).r,
                ),
                selected: brandChips.contains(widget.brands[index].id),
                onSelected: (isChipSelected) {
                  setState(() {
                    if (brandChips.contains(widget.brands[index].id)) {
                      brandChips.removeWhere(
                          (element) => element == widget.brands[index].id);
                      widget.selectedBrands(brandChips);
                    } else {
                      brandChips.add(widget.brands[index].id);
                      widget.selectedBrands(brandChips);
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

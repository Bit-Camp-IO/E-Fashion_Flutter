import 'package:efashion_flutter/presentation/product/components/home/search/search_filter/filter_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class PriceSliderComponent extends StatelessWidget {
  const PriceSliderComponent({super.key, required this.values, required this.onChanged});

  final SfRangeValues values;
  final void Function(SfRangeValues sliderValues) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FilterSection(title: 'Price'),
        SizedBox(height: 46.h),
        SfRangeSliderTheme(
          data: SfRangeSliderThemeData(
            tooltipTextStyle: Theme
                .of(context)
                .textTheme
                .labelSmall!
                .copyWith(
              color: Colors.white,
            ),
            tooltipBackgroundColor: Theme
                .of(context)
                .colorScheme
                .primary,
            thumbRadius: 10,
          ),
          child: SfRangeSlider(
              values: values,
              min: 0,
              max: 1000,
              stepSize: 50,
              interval: 50,
              enableTooltip: true,
              shouldAlwaysShowTooltip: true,
              tooltipShape: const SfPaddleTooltipShape(),
              showDividers: true,
              onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

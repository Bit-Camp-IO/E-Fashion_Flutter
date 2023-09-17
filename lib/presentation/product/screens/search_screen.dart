import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/shared/animations/slide_fade_animation_switcher.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/product/components/home/search/custom_type_ahead_field.dart';
import 'package:efashion_flutter/presentation/product/components/home/search/search_grid_view_component.dart';
import 'package:efashion_flutter/presentation/product/components/home/search/search_list_view_component.dart';
import 'package:efashion_flutter/presentation/product/mock/product_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late GlobalKey<FormState> _formKey;
  List<Product> searchList = [];
  int switchIndex = 0;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 26).r,
          child: Column(
            children: [
              CustomAppBar(
                appBarTitle: 'Search',
                appBarType: AppBarType.switcher,
                onIndexChange: (currentIndex) {
                  setState(() {
                    switchIndex = currentIndex!;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16).r,
                child: CustomTypeAheadField(
                  suggestionCallback: (pattern) {
                    return brandProducts
                        .where((product) => product.productName
                            .toLowerCase()
                            .startsWith(pattern.toLowerCase()))
                        .toList();
                  },
                  onChanged: (value) {
                    setState(
                      () {
                        searchList.clear();
                        if (value.isNotEmpty) {
                          searchList = brandProducts
                              .where((product) => product.productName
                                  .toLowerCase()
                                  .startsWith(value.toLowerCase()))
                              .toList();
                        }
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: SlideFadeAnimationSwitcher(
                  child: Builder(
                    builder: (context) {
                      if (searchList.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.search_normal_1,
                                color: Theme.of(context).colorScheme.primary,
                                size: 80.sp,
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                textAlign: TextAlign.center,
                                'No results yet\n try to type something.',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ),
                              )
                            ],
                          ),
                        );
                      } else {
                        return SlideFadeAnimationSwitcher(
                            child: switchIndex == 1
                                ? GridViewComponent(
                                    products: searchList,
                                  )
                                : ListViewComponent(
                                    products: searchList,
                                  ));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/category.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/search/custom_search_field.dart';
import 'package:efashion_flutter/presentation/product/components/search/filter/search_filter_sheet.dart';
import 'package:efashion_flutter/presentation/product/components/search/search_grid_view_component.dart';
import 'package:efashion_flutter/presentation/product/components/search/search_list_view_component.dart';
import 'package:efashion_flutter/presentation/product/components/search/no_search_yet.dart';
import 'package:efashion_flutter/presentation/shared/animations/slide_fade_animation_switcher.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SearchScreen extends StatefulWidget implements AutoRouteWrapper {
  const SearchScreen(
      {super.key, required this.categories, required this.brands});

  final List<Category> categories;
  final List<Brand> brands;

  @override
  State<SearchScreen> createState() => _SearchScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: this,
    );
  }
}

class _SearchScreenState extends State<SearchScreen> {
  late GlobalKey<FormState> _formKey;
  ValueNotifier switchIndex = ValueNotifier(0);
  String searchQuery = '';
  late String categories;
  late String sizes;
  late String minPrice;
  late String maxPrice;
  late SearchBloc searchBloc;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    searchBloc = context.read<SearchBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  switchIndex.value = currentIndex;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16).r,
                child: CustomSearchField(
                  onFilterTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      isScrollControlled: true,
                      isDismissible: false,
                      builder: (context) => BlocProvider.value(
                        value: searchBloc,
                        child: SearchFilterSheet(
                          brands: widget.brands,
                          categories: widget.categories,
                        ),
                      ),
                    );
                  },
                  onChanged: (value) {
                    searchQuery = value;
                    debugPrint(value.toString());
                    context
                        .read<SearchBloc>()
                        .add(SearchForProductsEvent(searchQuery: value));
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  buildWhen: (previous, current) =>
                      previous.searchProducts != current.searchProducts,
                  builder: (context, state) {
                    if (state.searchProducts.isEmpty) {
                      return const NoSearchYet();
                    } else {
                      return ValueListenableBuilder(
                        valueListenable: switchIndex,
                        builder: (context, currentSwitchIndex, child) =>
                            SlideFadeAnimationSwitcher(
                          child: currentSwitchIndex == 0
                              ? const ListViewComponent()
                              : const GridViewComponent(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _formKey.currentState?.dispose();
    switchIndex.dispose();
    super.dispose();
  }
}

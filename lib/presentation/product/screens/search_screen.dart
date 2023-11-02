import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/category.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/search/custom_search_field.dart';
import 'package:efashion_flutter/presentation/product/components/search/filter/search_filter_sheet.dart';
import 'package:efashion_flutter/presentation/product/components/search/no_search_result.dart';
import 'package:efashion_flutter/presentation/product/components/search/search_grid_view_component.dart';
import 'package:efashion_flutter/presentation/product/components/search/search_list_view_component.dart';
import 'package:efashion_flutter/presentation/product/components/search/no_search_yet.dart';
import 'package:efashion_flutter/presentation/shared/animations/slide_fade_animation_switcher.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/shared/widgets/no_internet_connection_widget.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
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

class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin {
  late GlobalKey<FormState> _formKey;
  ValueNotifier switchIndex = ValueNotifier(0);
  String searchQuery = '';
  late String categories;
  late String sizes;
  late String minPrice;
  late String maxPrice;
  late SearchBloc searchBloc;
  bool isLoading = false;
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
                appBarTitle: StringsManager.searchScreenTitle,
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
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => BlocProvider.value(
                        value: searchBloc,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: SearchFilterSheet(
                            brands: widget.brands,
                            categories: widget.categories,
                          ),
                        ),
                      ),
                    );
                  },
                  onChanged: (value) {
                    searchQuery = value;
                    context.read<SearchBloc>().add(SearchForProductsEvent(searchQuery: value));
                  },
                ),
              ),
              Expanded(
                child: BlocConsumer<SearchBloc, SearchState>(
                  listener: (context, state) {
                    if(state.searchState == BlocState.loading){
                      isLoading = true;
                    }else{
                      isLoading = false;
                    }
                  },
                  buildWhen: (previous, current) =>
                      previous.searchState != current.searchState,
                  builder: (context, state) {
                    if (state.searchProducts.isEmpty && state.searchState == BlocState.initial) {
                      return const NoSearchYet();
                    } else if (state.searchState == BlocState.failure) {
                      return NoInternetConnectionWidget(
                        onButtonTap: () {
                          context.read<SearchBloc>().add(SearchForProductsEvent(searchQuery: searchQuery,));
                        },
                      );
                    } else if(state.searchProducts.isEmpty && state.searchState == BlocState.success){
                      return const NoSearchResult();
                    }else{
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

import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/product/bloc/discover_cubit/discover_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/discover/skew_grid_view_component.dart';
import 'package:efashion_flutter/presentation/product/components/discover/skew_list_view_component.dart';
import 'package:efashion_flutter/presentation/shared/animations/slide_fade_animation_switcher.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DiscoverProductsScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const DiscoverProductsScreen(
      {super.key,
      this.brandName = '',
      this.brandId = '',
      required this.categories,
      required this.discoverScreenType});

  final String brandName;
  final String brandId;
  final String? categories;
  final DiscoverScreenType discoverScreenType;

  @override
  State<DiscoverProductsScreen> createState() => _DiscoverProductsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DiscoverBloc>(),
      child: this,
    );
  }
}

class _DiscoverProductsScreenState extends State<DiscoverProductsScreen> {
  late final String screenTitle;
  ValueNotifier<int> switchIndex = ValueNotifier(0);
  late final ScrollController listViewController;
  late final ScrollController gridViewController;

  @override
  void initState() {
    final DiscoverBloc discoverBloc = context.read<DiscoverBloc>();
    switch (widget.discoverScreenType) {
      case DiscoverScreenType.brand:
        screenTitle = 'Discover ${widget.brandName}';
        discoverBloc.add(GetBrandProductsEvent(
            brandId: widget.brandId, categories: widget.categories));
      case DiscoverScreenType.offers:
        screenTitle = 'Discover Offers';
        discoverBloc.add(GetOffersProductsEvent(categories: widget.categories));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16).r,
        child: Column(
          children: [
            CustomAppBar(
              appBarTitle: screenTitle,
              appBarType: AppBarType.switcher,
              onIndexChange: (currentIndex) {
                switchIndex.value = currentIndex!;
              },
            ),
            ValueListenableBuilder(
              valueListenable: switchIndex,
              builder: (context, index, child) => Expanded(
                child: SlideFadeAnimationSwitcher(
                  child: index == 0
                      ? SkewListViewComponent(
                          discoverScreenType: widget.discoverScreenType,
                          categories: widget.categories,
                          brandId: widget.brandId,
                        )
                      : SkewGridViewComponent(
                          discoverScreenType: widget.discoverScreenType,
                          categories: widget.categories,
                          brandId: widget.brandId,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    switchIndex.dispose();
    listViewController.dispose();
    gridViewController.dispose();
    super.dispose();
  }
}

enum DiscoverScreenType {
  brand,
  offers,
}

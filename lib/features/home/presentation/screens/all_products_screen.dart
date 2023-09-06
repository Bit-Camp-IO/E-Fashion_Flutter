import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/animations/slide_fade_animation_switcher.dart';
import 'package:efashion_flutter/shared/presentation/widgets/custom_appbar.dart';
import 'package:efashion_flutter/features/home/presentation/components/see_all/skew_grid_view_component.dart';
import 'package:efashion_flutter/features/home/presentation/components/see_all/skew_list_view_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  int switchIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16).r,
        child: Column(
          children: [
            CustomAppBar(
              appBarTitle: 'Discover Zara',
              appBarType: AppBarType.switcher,
              onIndexChange: (currentIndex) {
                setState(() {
                  switchIndex = currentIndex!;
                });
              },
            ),
            Expanded(
              child: SlideFadeAnimationSwitcher(
                child: switchIndex == 1
                    ? const SkewGridViewComponent()
                    : const SkewListViewComponent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

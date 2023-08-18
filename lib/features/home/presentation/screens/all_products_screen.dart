import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/features/home/presentation/components/see_all/grid_view_component.dart';
import 'package:efashion_flutter/features/home/presentation/components/see_all/list_view_component.dart';
import 'package:efashion_flutter/features/home/presentation/components/see_all/square_button.dart';
import 'package:efashion_flutter/features/home/presentation/components/see_all/vertical_rectangle_button.dart';
import 'package:efashion_flutter/core/animations/slide_fade_animation_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  int switchIndex = 0;

  void _handleSwitchTap(int index) {
    setState(() {
      switchIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16).r,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.popRoute();
                  },
                  icon: const Icon(Iconsax.arrow_left),
                ),
                const Text('Discover Zara'),
                const Spacer(
                  flex: 1,
                ),
                SquareButton(
                  onTap: () {
                    setState(() {
                      _handleSwitchTap(0);
                    });
                  },
                  isSelected: switchIndex == 0,
                ),
                SizedBox(width: 4.w),
                VerticalRectangleButton(
                  onTap: () {
                    setState(() {
                      _handleSwitchTap(1);
                    });
                  },
                  isSelected: switchIndex == 1,
                ),
              ],
            ),
            Expanded(
              child: SlideFadeAnimationSwitcher(
                child: switchIndex == 1
                    ? const GridViewComponent()
                    : const ListViewComponent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

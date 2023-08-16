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
class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({Key? key}) : super(key: key);

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  bool isGrid = false;
  List<bool> selectedButton = [true, false];

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
                      isGrid = false;
                      selectedButton = [true, false];
                    });
                  },
                  isSelected: selectedButton[0],
                ),
                SizedBox(width: 4.w),
                VerticalRectangleButton(
                  onTap: () {
                    setState(() {
                      isGrid = true;
                      selectedButton = [false, true];
                    });
                  },
                  isSelected: selectedButton[1],
                ),
              ],
            ),
            Expanded(
              child: SlideFadeAnimationSwitcher(
                child: isGrid
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

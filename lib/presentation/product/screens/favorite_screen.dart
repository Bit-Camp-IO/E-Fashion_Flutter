import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/shared/animations/slide_fade_animation_switcher.dart';
import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/favorite/favorite_grid_view_component.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/product/components/favorite/favorite_list_view_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class FavoriteScreen extends StatefulWidget implements AutoRouteWrapper{
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
   return BlocProvider(
     create: (context) => getIt<HomeBloc>()..add(const GetProductOffersEvent()),
     child: this,
   );
  }
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int switchIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16).r,
        child: Column(
          children: [
            CustomAppBar(
              appBarTitle: 'Your Favourites 💙',
              disableBackButton: true,
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
                    ? const FavoriteGridViewComponent()
                    : const FavoriteListViewComponent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

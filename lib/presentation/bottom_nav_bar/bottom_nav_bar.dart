import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/product/bloc/favorite_cubit/favorite_cubit.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage(name: 'BottomNavBarRoute')
class BottomNavBar extends StatefulWidget implements AutoRouteWrapper {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<FavoriteCubit>()
          ..getUserFavoriteIdListEvent()
          ..getFavoriteProductsList(),
      child: this,
    );
  }
}

class _BottomNavBarState extends State<BottomNavBar> {
  DateTime? _lastTapTime;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      routes: const [
        HomeRoute(),
        CartRoute(),
        FavoriteRoute(),
        AccountRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return WillPopScope(
          onWillPop: () async {
            if (tabsRouter.activeIndex == 0) {
              return Future.value(true);
            } else {
              tabsRouter.setActiveIndex(tabsRouter.activeIndex - 1);
              return Future.value(false);
            }
          },
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0).r,
            child: Container(
              height: 70.h,
              width: 328.h,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ).r,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ).r,
                child: BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  onTap: (value) {
                    final timeNow = DateTime.now();
                    if (_lastTapTime != null &&
                        timeNow.difference(_lastTapTime!) <=
                            const Duration(milliseconds: 300)) {
                      switch (tabsRouter.activeIndex) {
                        case 0:
                          context.router.root.navigate(const HomeRoute());
                        case 1:
                          context.router.root.navigate(const CartRoute());
                        case 2:
                          context.router.root.navigate(const FavoriteRoute());
                        case 3:
                          context.router.root.navigate(const AccountRoute());
                      }
                    } else {
                      tabsRouter.setActiveIndex(value);
                    }
                    _lastTapTime = timeNow;
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Iconsax.home),
                      label: StringsManager.homeTabLabel,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Iconsax.bag_2),
                      label: StringsManager.cartTabLabel,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Iconsax.heart),
                      label: StringsManager.favoriteTabLabel,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Iconsax.user),
                      label: StringsManager.accountTabLabel,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

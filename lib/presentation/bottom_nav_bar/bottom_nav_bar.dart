import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/account/bloc/profile_cubit/profile_cubit.dart';
import 'package:efashion_flutter/presentation/product/bloc/collections_cubit/collections_cubit.dart';
import 'package:efashion_flutter/presentation/shared/bloc/favorite_cubit/favorite_cubit.dart';
import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart';
import 'package:efashion_flutter/presentation/shared/bloc/notifications_cubit/notifications_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_tick.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:efashion_flutter/shared/util/notifications_manager.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProfileCubit>()..getUserData(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => getIt<FavoriteCubit>()..getUserFavoriteIdList(), lazy: false,
        ),
        BlocProvider(
          create: (context) => getIt<CartCubit>()..getCartProducts(),
        ),
        BlocProvider(
          create: (context) => getIt<CollectionsCubit>()..getCollectionsList(),
        ),
      ],
      child: this,
    );
  }
}

class _BottomNavBarState extends State<BottomNavBar>
    with WidgetsBindingObserver {
  DateTime? _lastTapTime;
  int currentTickCount = 0;
  bool hasTickChanged = false;
  double leftPosition = 125.w;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint(state.toString());
    if (state == AppLifecycleState.resumed) {
      if(context.read<NotificationsCubit>().state.notificationsPermissionsState == NotificationsPermissionsState.permanentlyDenied){
        context.read<NotificationsCubit>().checkForNotificationsPermission();
      }
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    context.read<NotificationsCubit>().getNotificationsState();
    NotificationsManager.onClickNotification.stream.listen((event) {
      if (event.payload == NotificationType.newMessage.value) {
        context.pushRoute(const ChatSupportRoute());
      } else {
        context.pushRoute(const NotificationsRoute());
      }
    });
    super.initState();
  }

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
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    BottomNavigationBar(
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
                    BlocBuilder<CartCubit, CartState>(
                      buildWhen: (previous, current) =>
                      previous.cart.products.length != current.cart.products.length,
                      builder: (context, state) {
                        return AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: 18.h,
                          left: 120.w,
                          child: CustomTick(
                            tickCount: state.cart.products.length,
                            isTickVisible: state.cart.products.isNotEmpty,
                          ),
                        );
                      },
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

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

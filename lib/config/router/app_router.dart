import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/features/account/presentation/screens/account_screen.dart';
import 'package:efashion_flutter/features/auth/presentation/screens/login_screen.dart';
import 'package:efashion_flutter/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:efashion_flutter/features/auth/presentation/screens/splash_screen.dart';
import 'package:efashion_flutter/features/auth/presentation/screens/welcome_screen.dart';
import 'package:efashion_flutter/features/cart/presentation/screens/cart_screen.dart';
import 'package:efashion_flutter/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:efashion_flutter/features/home/presentation/screens/add_review_screen.dart';
import 'package:efashion_flutter/features/home/presentation/screens/all_reviews_screen.dart';
import 'package:efashion_flutter/features/home/presentation/screens/home_screen.dart';
import 'package:efashion_flutter/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:efashion_flutter/features/home/presentation/screens/details_screen.dart';
import 'package:efashion_flutter/features/home/presentation/screens/all_products_screen.dart';
import 'package:efashion_flutter/features/home/presentation/screens/notifications_screen.dart';
import 'package:efashion_flutter/features/home/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
@singleton
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          children: [
            AutoRoute(
              page: SplashRoute.page,
            ),
            AutoRoute(
              page: WelcomeRoute.page,
              initial: true,
            ),
            AutoRoute(
              page: LoginRoute.page,
            ),
            AutoRoute(
              page: SignupRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: BottomNavBarRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: HomeTabRoute.page,
              initial: true,
              children: [
                AutoRoute(
                  page: HomeRoute.page,
                  initial: true,
                ),
                CustomRoute(
                  page: AllProductsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
                CustomRoute(
                  page: DetailsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
                CustomRoute(
                  page: AddReviewRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
                CustomRoute(
                  page: AllReviewsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
                CustomRoute(
                  page: NotificationsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
                CustomRoute(
                  page: SearchRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
              ],
            ),
            AutoRoute(
              page: CartRoute.page,
              children: [
                AutoRoute(
                  page: CartRoute.page,
                  initial: true,
                )
              ],
            ),
            AutoRoute(
              page: FavoriteTabRoute.page,
              children: [
                AutoRoute(
                  page: FavoriteRoute.page,
                  initial: true,
                )
              ],
            ),
            AutoRoute(
              page: AccountTabRoute.page,
              children: [
                AutoRoute(
                  page: AccountRoute.page,
                  initial: true,
                )
              ],
            ),
          ],
        )
      ];
}

@RoutePage(name: 'AuthRoute')
class Auth extends AutoRouter {
  const Auth({super.key});
}

@RoutePage(name: 'HomeTabRoute')
class HomeTab extends AutoRouter {
  const HomeTab({super.key});
}

@RoutePage(name: 'CartTabRoute')
class CartTab extends AutoRouter {
  const CartTab({super.key});
}

@RoutePage(name: 'FavoriteTabRoute')
class FavoriteTab extends AutoRouter {
  const FavoriteTab({super.key});
}

@RoutePage(name: 'AccountTabRoute')
class AccountTab extends AutoRouter {
  const AccountTab({super.key});
}

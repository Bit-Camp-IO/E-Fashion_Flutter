import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/features/account/presentation/screens/account_screen.dart';
import 'package:efashion_flutter/features/account/presentation/screens/chat_support_screen.dart';
import 'package:efashion_flutter/features/account/presentation/screens/edit_profile_screen.dart';
import 'package:efashion_flutter/features/account/presentation/screens/location_screen.dart';
import 'package:efashion_flutter/features/account/presentation/screens/order_status_screen.dart';
import 'package:efashion_flutter/features/auth/presentation/screens/login_screen.dart';
import 'package:efashion_flutter/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:efashion_flutter/features/auth/presentation/screens/splash_screen.dart';
import 'package:efashion_flutter/features/auth/presentation/screens/welcome_screen.dart';
import 'package:efashion_flutter/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:efashion_flutter/features/cart/presentation/screens/cart_screen.dart';
import 'package:efashion_flutter/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:efashion_flutter/features/home/presentation/screens/home_screen.dart';
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
              children: [
                AutoRoute(
                  page: HomeRoute.page,
                )
              ],
            ),
            AutoRoute(
              page: CartRoute.page,
              children: [
                AutoRoute(
                  page: CartRoute.page,
                )
              ],
            ),
            AutoRoute(
              page: FavoriteTabRoute.page,
              children: [
                AutoRoute(
                  page: FavoriteRoute.page,
                )
              ],
            ),
            AutoRoute(
              page: AccountTabRoute.page,
              initial: true,
              children: [
                AutoRoute(
                  page: AccountRoute.page,
                  initial: true,
                ),
                CustomRoute(
                  page: EditProfileRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
                CustomRoute(
                  page: LocationRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
                CustomRoute(
                  page: OrderStatusRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
              ],
            ),
          ],
        ),
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

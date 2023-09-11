import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/features/account/presentation/screens/account_screen.dart';
import 'package:efashion_flutter/features/account/presentation/screens/change_password_screen.dart';
import 'package:efashion_flutter/features/account/presentation/screens/chat_support_screen.dart';
import 'package:efashion_flutter/features/account/presentation/screens/edit_profile_screen.dart';
import 'package:efashion_flutter/features/account/presentation/screens/location_screen.dart';
import 'package:efashion_flutter/features/account/presentation/screens/delivery_status_screen.dart';
import 'package:efashion_flutter/features/account/presentation/screens/orders_status_screen.dart';
import 'package:efashion_flutter/features/auth/presentation/screens/email_verification_screen.dart';
import 'package:efashion_flutter/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:efashion_flutter/features/auth/presentation/screens/login_screen.dart';
import 'package:efashion_flutter/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:efashion_flutter/features/auth/presentation/screens/sign_up_screen.dart';
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
import 'package:efashion_flutter/features/home/presentation/screens/search_filter_screen.dart';
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
          initial: true,
          children: [
            CustomRoute(
              page: WelcomeRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: LoginRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: SignupRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: ForgetPasswordRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: EmailVerificationRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: ResetPasswordRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
          ],
        ),
        CustomRoute(
          page: BottomNavBarRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
          children: [
            AutoRoute(
              page: HomeTabRoute.page,
              initial: true,
              children: [
                CustomRoute(
                  page: HomeRoute.page,
                  initial: true,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
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
                CustomRoute(
                  page: SearchFilterRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
              ],
            ),
            AutoRoute(
              page: CartRoute.page,
              maintainState: false,
              children: [
                CustomRoute(
                  page: CartRoute.page,
                  initial: true,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  maintainState: false
                )
              ],
            ),
            AutoRoute(
              page: FavoriteTabRoute.page,
              children: [
                CustomRoute(
                  page: FavoriteRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  initial: true,
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
              ],
            ),
            AutoRoute(
              page: AccountTabRoute.page,
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
                  page: OrdersStatusRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
                CustomRoute(
                  page: DeliveryStatusRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
                CustomRoute(
                  page: ChangePasswordRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
              ],
            ),
          ],
        ),
        CustomRoute(
          page: ChatSupportRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
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

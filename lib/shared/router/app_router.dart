import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/account/screens/account_screen.dart';
import 'package:efashion_flutter/presentation/account/screens/change_password_screen.dart';
import 'package:efashion_flutter/presentation/account/screens/chat_support_screen.dart';
import 'package:efashion_flutter/presentation/account/screens/edit_profile_screen.dart';
import 'package:efashion_flutter/presentation/account/screens/location_screen.dart';
import 'package:efashion_flutter/presentation/account/screens/delivery_status_screen.dart';
import 'package:efashion_flutter/presentation/account/screens/orders_status_screen.dart';
import 'package:efashion_flutter/presentation/auth/cubits/forget_password/forget_password_cubit.dart';
import 'package:efashion_flutter/presentation/auth/screens/otp_verification_screen.dart';
import 'package:efashion_flutter/presentation/auth/screens/forget_password_screen.dart';
import 'package:efashion_flutter/presentation/auth/screens/login_screen.dart';
import 'package:efashion_flutter/presentation/auth/screens/reset_password_screen.dart';
import 'package:efashion_flutter/presentation/auth/screens/sign_up_screen.dart';
import 'package:efashion_flutter/presentation/auth/screens/welcome_screen.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/product/screens/cart_screen.dart';
import 'package:efashion_flutter/presentation/product/screens/favorite_screen.dart';
import 'package:efashion_flutter/presentation/product/screens/add_or_edit_review_screen.dart';
import 'package:efashion_flutter/presentation/product/screens/all_reviews_screen.dart';
import 'package:efashion_flutter/presentation/product/screens/home_screen.dart';
import 'package:efashion_flutter/presentation/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:efashion_flutter/presentation/product/screens/product_details_screen.dart';
import 'package:efashion_flutter/presentation/product/screens/discover_products_screen.dart';
import 'package:efashion_flutter/presentation/product/screens/notifications_screen.dart';
import 'package:efashion_flutter/presentation/product/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              page: ForgetPasswordRoutes.page,
              children: [
                CustomRoute(
                  page: ForgetPasswordRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
                CustomRoute(
                  page: OtpVerificationRoute.page,
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
                  page: DiscoverProductsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 300,
                ),
                AutoRoute(
                  page: DetailsRoute.page,
                  children: [
                    CustomRoute(
                      page: ProductDetailsRoute.page,
                      transitionsBuilder: TransitionsBuilders.fadeIn,
                      durationInMilliseconds: 300,
                    ),
                    CustomRoute(
                      page: AddOrEditReviewRoute.page,
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
              maintainState: false,
              children: [
                CustomRoute(
                    page: CartRoute.page,
                    initial: true,
                    transitionsBuilder: TransitionsBuilders.fadeIn,
                    maintainState: false)
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
                AutoRoute(
                  page: DetailsRoute.page,
                  children: [
                    CustomRoute(
                      page: ProductDetailsRoute.page,
                      transitionsBuilder: TransitionsBuilders.fadeIn,
                      durationInMilliseconds: 300,
                    ),
                    CustomRoute(
                      page: AddOrEditReviewRoute.page,
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
        CustomRoute(
          page: LocationRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
        ),
      ];
}

@RoutePage(name: 'AuthRoute')
class Auth extends AutoRouter {
  const Auth({super.key});
}

@RoutePage(name: 'DetailsRoute')
class Details extends AutoRouter implements AutoRouteWrapper {
  const Details({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DetailsCubit>(),
      child: this,
    );
  }
}

@RoutePage(name: 'ForgetPasswordRoutes')
class ForgetPassword extends AutoRouter implements AutoRouteWrapper {
  const ForgetPassword({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgetPasswordCubit>(),
      child: this,
    );
  }
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

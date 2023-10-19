// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreen(),
      );
    },
    AccountTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountTab(),
      );
    },
    AddOrEditReviewRoute.name: (routeData) {
      final args = routeData.argsAs<AddOrEditReviewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddOrEditReviewScreen(
          key: args.key,
          productId: args.productId,
          rating: args.rating,
        ),
      );
    },
    AllReviewsRoute.name: (routeData) {
      final args = routeData.argsAs<AllReviewsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AllReviewsScreen(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Auth(),
      );
    },
    BottomNavBarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const BottomNavBar()),
      );
    },
    CartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartScreen(),
      );
    },
    CartTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartTab(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ChangePasswordScreen()),
      );
    },
    ChatSupportRoute.name: (routeData) {
      final args = routeData.argsAs<ChatSupportRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ChatSupportScreen(
          key: args.key,
          userId: args.userId,
        )),
      );
    },
    CollectionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CollectionDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CollectionDetailsScreen(
          key: args.key,
          collectionId: args.collectionId,
          collectionName: args.collectionName,
          collectionPrice: args.collectionPrice,
        ),
      );
    },
    DetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const Details()),
      );
    },
    DiscoverProductsRoute.name: (routeData) {
      final args = routeData.argsAs<DiscoverProductsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: DiscoverProductsScreen(
          key: args.key,
          brandName: args.brandName,
          brandId: args.brandId,
          categories: args.categories,
          discoverScreenType: args.discoverScreenType,
        )),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfileScreen(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteScreen(),
      );
    },
    FavoriteTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteTab(),
      );
    },
    ForgetPasswordRoutes.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ForgetPassword()),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgetPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const HomeScreen()),
      );
    },
    HomeTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const HomeTab()),
      );
    },
    LocationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const LocationScreen()),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const LoginScreen()),
      );
    },
    NotificationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationsScreen(),
      );
    },
    OrdersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const OrdersScreen()),
      );
    },
    OtpVerificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OtpVerificationScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailsScreen(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPasswordScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: SearchScreen(
          key: args.key,
          categories: args.categories,
          brands: args.brands,
        )),
      );
    },
    SignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SignupScreen()),
      );
    },
    TrackOrderRoute.name: (routeData) {
      final args = routeData.argsAs<TrackOrderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TrackOrderScreen(
          key: args.key,
          activeStep: args.activeStep,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountTab]
class AccountTabRoute extends PageRouteInfo<void> {
  const AccountTabRoute({List<PageRouteInfo>? children})
      : super(
          AccountTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddOrEditReviewScreen]
class AddOrEditReviewRoute extends PageRouteInfo<AddOrEditReviewRouteArgs> {
  AddOrEditReviewRoute({
    Key? key,
    required String productId,
    int rating = 0,
    List<PageRouteInfo>? children,
  }) : super(
          AddOrEditReviewRoute.name,
          args: AddOrEditReviewRouteArgs(
            key: key,
            productId: productId,
            rating: rating,
          ),
          initialChildren: children,
        );

  static const String name = 'AddOrEditReviewRoute';

  static const PageInfo<AddOrEditReviewRouteArgs> page =
      PageInfo<AddOrEditReviewRouteArgs>(name);
}

class AddOrEditReviewRouteArgs {
  const AddOrEditReviewRouteArgs({
    this.key,
    required this.productId,
    this.rating = 0,
  });

  final Key? key;

  final String productId;

  final int rating;

  @override
  String toString() {
    return 'AddOrEditReviewRouteArgs{key: $key, productId: $productId, rating: $rating}';
  }
}

/// generated route for
/// [AllReviewsScreen]
class AllReviewsRoute extends PageRouteInfo<AllReviewsRouteArgs> {
  AllReviewsRoute({
    Key? key,
    required String productId,
    List<PageRouteInfo>? children,
  }) : super(
          AllReviewsRoute.name,
          args: AllReviewsRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'AllReviewsRoute';

  static const PageInfo<AllReviewsRouteArgs> page =
      PageInfo<AllReviewsRouteArgs>(name);
}

class AllReviewsRouteArgs {
  const AllReviewsRouteArgs({
    this.key,
    required this.productId,
  });

  final Key? key;

  final String productId;

  @override
  String toString() {
    return 'AllReviewsRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [Auth]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BottomNavBar]
class BottomNavBarRoute extends PageRouteInfo<void> {
  const BottomNavBarRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CartTab]
class CartTabRoute extends PageRouteInfo<void> {
  const CartTabRoute({List<PageRouteInfo>? children})
      : super(
          CartTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangePasswordScreen]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatSupportScreen]
class ChatSupportRoute extends PageRouteInfo<ChatSupportRouteArgs> {
  ChatSupportRoute({
    Key? key,
    required String userId,
    List<PageRouteInfo>? children,
  }) : super(
          ChatSupportRoute.name,
          args: ChatSupportRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatSupportRoute';

  static const PageInfo<ChatSupportRouteArgs> page =
      PageInfo<ChatSupportRouteArgs>(name);
}

class ChatSupportRouteArgs {
  const ChatSupportRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final String userId;

  @override
  String toString() {
    return 'ChatSupportRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [CollectionDetailsScreen]
class CollectionDetailsRoute extends PageRouteInfo<CollectionDetailsRouteArgs> {
  CollectionDetailsRoute({
    Key? key,
    required String collectionId,
    required String collectionName,
    required int collectionPrice,
    List<PageRouteInfo>? children,
  }) : super(
          CollectionDetailsRoute.name,
          args: CollectionDetailsRouteArgs(
            key: key,
            collectionId: collectionId,
            collectionName: collectionName,
            collectionPrice: collectionPrice,
          ),
          initialChildren: children,
        );

  static const String name = 'CollectionDetailsRoute';

  static const PageInfo<CollectionDetailsRouteArgs> page =
      PageInfo<CollectionDetailsRouteArgs>(name);
}

class CollectionDetailsRouteArgs {
  const CollectionDetailsRouteArgs({
    this.key,
    required this.collectionId,
    required this.collectionName,
    required this.collectionPrice,
  });

  final Key? key;

  final String collectionId;

  final String collectionName;

  final int collectionPrice;

  @override
  String toString() {
    return 'CollectionDetailsRouteArgs{key: $key, collectionId: $collectionId, collectionName: $collectionName, collectionPrice: $collectionPrice}';
  }
}

/// generated route for
/// [Details]
class DetailsRoute extends PageRouteInfo<void> {
  const DetailsRoute({List<PageRouteInfo>? children})
      : super(
          DetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DiscoverProductsScreen]
class DiscoverProductsRoute extends PageRouteInfo<DiscoverProductsRouteArgs> {
  DiscoverProductsRoute({
    Key? key,
    String brandName = '',
    String brandId = '',
    required String? categories,
    required DiscoverScreenType discoverScreenType,
    List<PageRouteInfo>? children,
  }) : super(
          DiscoverProductsRoute.name,
          args: DiscoverProductsRouteArgs(
            key: key,
            brandName: brandName,
            brandId: brandId,
            categories: categories,
            discoverScreenType: discoverScreenType,
          ),
          initialChildren: children,
        );

  static const String name = 'DiscoverProductsRoute';

  static const PageInfo<DiscoverProductsRouteArgs> page =
      PageInfo<DiscoverProductsRouteArgs>(name);
}

class DiscoverProductsRouteArgs {
  const DiscoverProductsRouteArgs({
    this.key,
    this.brandName = '',
    this.brandId = '',
    required this.categories,
    required this.discoverScreenType,
  });

  final Key? key;

  final String brandName;

  final String brandId;

  final String? categories;

  final DiscoverScreenType discoverScreenType;

  @override
  String toString() {
    return 'DiscoverProductsRouteArgs{key: $key, brandName: $brandName, brandId: $brandId, categories: $categories, discoverScreenType: $discoverScreenType}';
  }
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoriteScreen]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoriteTab]
class FavoriteTabRoute extends PageRouteInfo<void> {
  const FavoriteTabRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgetPassword]
class ForgetPasswordRoutes extends PageRouteInfo<void> {
  const ForgetPasswordRoutes({List<PageRouteInfo>? children})
      : super(
          ForgetPasswordRoutes.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoutes';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgetPasswordScreen]
class ForgetPasswordRoute extends PageRouteInfo<void> {
  const ForgetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeTab]
class HomeTabRoute extends PageRouteInfo<void> {
  const HomeTabRoute({List<PageRouteInfo>? children})
      : super(
          HomeTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LocationScreen]
class LocationRoute extends PageRouteInfo<void> {
  const LocationRoute({List<PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationsScreen]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrdersScreen]
class OrdersRoute extends PageRouteInfo<void> {
  const OrdersRoute({List<PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OtpVerificationScreen]
class OtpVerificationRoute extends PageRouteInfo<void> {
  const OtpVerificationRoute({List<PageRouteInfo>? children})
      : super(
          OtpVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtpVerificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductDetailsScreen]
class ProductDetailsRoute extends PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    Key? key,
    required String productId,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const PageInfo<ProductDetailsRouteArgs> page =
      PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.productId,
  });

  final Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [ResetPasswordScreen]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    Key? key,
    required List<Category> categories,
    required List<Brand> brands,
    List<PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            categories: categories,
            brands: brands,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<SearchRouteArgs> page = PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    required this.categories,
    required this.brands,
  });

  final Key? key;

  final List<Category> categories;

  final List<Brand> brands;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, categories: $categories, brands: $brands}';
  }
}

/// generated route for
/// [SignupScreen]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TrackOrderScreen]
class TrackOrderRoute extends PageRouteInfo<TrackOrderRouteArgs> {
  TrackOrderRoute({
    Key? key,
    required int activeStep,
    List<PageRouteInfo>? children,
  }) : super(
          TrackOrderRoute.name,
          args: TrackOrderRouteArgs(
            key: key,
            activeStep: activeStep,
          ),
          initialChildren: children,
        );

  static const String name = 'TrackOrderRoute';

  static const PageInfo<TrackOrderRouteArgs> page =
      PageInfo<TrackOrderRouteArgs>(name);
}

class TrackOrderRouteArgs {
  const TrackOrderRouteArgs({
    this.key,
    required this.activeStep,
  });

  final Key? key;

  final int activeStep;

  @override
  String toString() {
    return 'TrackOrderRouteArgs{key: $key, activeStep: $activeStep}';
  }
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

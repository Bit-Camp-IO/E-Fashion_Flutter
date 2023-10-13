// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:efashion_flutter/components/authComponent/data/datasources/local/auth_local_data_source.dart'
    as _i5;
import 'package:efashion_flutter/components/authComponent/data/datasources/remote/auth_data_source.dart'
    as _i6;
import 'package:efashion_flutter/components/authComponent/data/repositories/auth_repository_impl.dart'
    as _i8;
import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart'
    as _i7;
import 'package:efashion_flutter/components/authComponent/domain/usecases/change_password_usecase.dart'
    as _i12;
import 'package:efashion_flutter/components/authComponent/domain/usecases/check_if_tokens_exist_use_case.dart'
    as _i13;
import 'package:efashion_flutter/components/authComponent/domain/usecases/delete_tokens_use_case.dart'
    as _i15;
import 'package:efashion_flutter/components/authComponent/domain/usecases/forget_password_usecase.dart'
    as _i19;
import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart'
    as _i22;
import 'package:efashion_flutter/components/authComponent/domain/usecases/reset_password_usecase.dart'
    as _i33;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_login_usecase.dart'
    as _i38;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_signup_usecase.dart'
    as _i42;
import 'package:efashion_flutter/components/authComponent/domain/usecases/verify_otp_usecase.dart'
    as _i43;
import 'package:efashion_flutter/components/cartComponent/data/datasources/cart_datasource.dart'
    as _i9;
import 'package:efashion_flutter/components/cartComponent/data/repositories/cart_repository_impl.dart'
    as _i11;
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart'
    as _i10;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/add_product_to_cart_usecase.dart'
    as _i45;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/create_payment_intent_usecase.dart'
    as _i14;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/edit_product_quantity_usecase.dart'
    as _i18;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/get_cart_products_usecase.dart'
    as _i20;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/get_orders_list_usecase.dart'
    as _i21;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/remove_product_from_cart_usecase.dart'
    as _i31;
import 'package:efashion_flutter/components/mapComponent/data/datasources/map_datasource.dart'
    as _i23;
import 'package:efashion_flutter/components/mapComponent/data/repositories/map_repository_impl.dart'
    as _i25;
import 'package:efashion_flutter/components/mapComponent/domain/repositories/map_repository.dart'
    as _i24;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_place_latitude_and_longitude_usecase.dart'
    as _i57;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_places_suggestions_usecase.dart'
    as _i58;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_user_location_usecase.dart'
    as _i64;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/update_user_location_usecase.dart'
    as _i36;
import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source.dart'
    as _i27;
import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source_impl.dart'
    as _i28;
import 'package:efashion_flutter/components/productComponent/data/repositories/product_repository_impl.dart'
    as _i30;
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart'
    as _i29;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/add_product_to_favorite_list_usecase.dart'
    as _i46;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_favorite_products_usecase.dart'
    as _i56;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_user_favorite_products_ids.dart'
    as _i63;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/remove_product_from_favorite_list_usecase.dart'
    as _i32;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/add_or_edit_product_review_usecase.dart'
    as _i44;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_all_brands_products_usecase.dart'
    as _i51;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brand_products_usecase.dart'
    as _i53;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brands_usecase.dart'
    as _i54;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_categories_usecase.dart'
    as _i55;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_details_usecase.dart'
    as _i59;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_reviews_and_ratings_usecase.dart'
    as _i60;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_products_offers_usecase.dart'
    as _i61;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_user_review_usecase.dart'
    as _i65;
import 'package:efashion_flutter/components/productComponent/domain/usecases/search/search_for_product_usecase.dart'
    as _i34;
import 'package:efashion_flutter/components/userComponent/data/datasources/local/user_local_data_source.dart'
    as _i37;
import 'package:efashion_flutter/components/userComponent/data/datasources/remote/user_remote_data_source.dart'
    as _i39;
import 'package:efashion_flutter/components/userComponent/data/repositories/user_repository_impl.dart'
    as _i41;
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart'
    as _i40;
import 'package:efashion_flutter/components/userComponent/domain/usecases/change_app_theme_usecase.dart'
    as _i48;
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_app_theme_usecase.dart'
    as _i52;
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_user_data_usecase.dart'
    as _i62;
import 'package:efashion_flutter/presentation/account/bloc/change_password_cubit/change_password_cubit.dart'
    as _i49;
import 'package:efashion_flutter/presentation/account/bloc/maps_bloc/map_bloc.dart'
    as _i68;
import 'package:efashion_flutter/presentation/account/bloc/orders_cubit/orders_cubit.dart'
    as _i26;
import 'package:efashion_flutter/presentation/account/bloc/profile_cubit/profile_cubit.dart'
    as _i69;
import 'package:efashion_flutter/presentation/auth/cubits/forget_password/forget_password_cubit.dart'
    as _i50;
import 'package:efashion_flutter/presentation/auth/cubits/login/login_cubit.dart'
    as _i67;
import 'package:efashion_flutter/presentation/auth/cubits/signup/signup_cubit.dart'
    as _i71;
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart'
    as _i73;
import 'package:efashion_flutter/presentation/product/bloc/discover_cubit/discover_bloc.dart'
    as _i74;
import 'package:efashion_flutter/presentation/product/bloc/favorite_cubit/favorite_cubit.dart'
    as _i75;
import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart'
    as _i66;
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart'
    as _i70;
import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart'
    as _i47;
import 'package:efashion_flutter/presentation/shared/bloc/theme_cubit/theme_cubit.dart'
    as _i72;
import 'package:efashion_flutter/presentation/shared/bloc/tokens_cubit/tokens_cubit.dart'
    as _i35;
import 'package:efashion_flutter/register_module.dart' as _i76;
import 'package:efashion_flutter/shared/api/api_consumer.dart' as _i3;
import 'package:efashion_flutter/shared/api/dio_interceptor.dart' as _i16;
import 'package:efashion_flutter/shared/api/dio_logger.dart' as _i17;
import 'package:efashion_flutter/shared/router/app_router.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.ApiConsumer>(
      () => registerModule.mapsApiConsumer,
      instanceName: 'mapsApiConsumer',
    );
    gh.lazySingleton<_i3.ApiConsumer>(
      () => registerModule.mainApiConsumer,
      instanceName: 'mainApiConsumer',
    );
    gh.singleton<_i4.AppRouter>(_i4.AppRouter());
    gh.lazySingleton<_i5.AuthLocalDataSource>(
        () => _i5.AuthLocalDataSourceImpl());
    gh.lazySingleton<_i6.AuthRemoteDataSource>(() => _i6.AuthDataSourceImpl(
        gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i7.AuthRepository>(() => _i8.AuthRepositoryImpl(
          gh<_i6.AuthRemoteDataSource>(),
          gh<_i5.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i9.CartDataSource>(() => _i9.CartDataSourceImpl(
        gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i10.CartRepository>(
        () => _i11.CartRepositoryImpl(gh<_i9.CartDataSource>()));
    gh.lazySingleton<_i12.ChangePasswordUseCase>(
        () => _i12.ChangePasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i13.CheckIfTokensExistUseCase>(
        () => _i13.CheckIfTokensExistUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i14.CreatePaymentIntentUseCase>(
        () => _i14.CreatePaymentIntentUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i15.DeleteTokensUseCase>(
        () => _i15.DeleteTokensUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i16.DioInterceptor>(() => _i16.DioInterceptor());
    gh.lazySingleton<_i17.DioLogInterceptor>(() => _i17.DioLogInterceptor());
    gh.lazySingleton<_i18.EditProductQuantityUseCase>(
        () => _i18.EditProductQuantityUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i19.ForgetPasswordUseCase>(
        () => _i19.ForgetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i20.GetCartProductsUseCase>(
        () => _i20.GetCartProductsUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i21.GetOrdersListUseCase>(
        () => _i21.GetOrdersListUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i22.GetUserAccessTokenUseCase>(
        () => _i22.GetUserAccessTokenUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i23.MapDataSource>(() => _i23.MapDataSourceImpl(
          gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer'),
          gh<_i3.ApiConsumer>(instanceName: 'mapsApiConsumer'),
        ));
    gh.lazySingleton<_i24.MapRepository>(
        () => _i25.MapRepositoryImpl(gh<_i23.MapDataSource>()));
    gh.factory<_i26.OrdersCubit>(() => _i26.OrdersCubit(
          gh<_i22.GetUserAccessTokenUseCase>(),
          gh<_i21.GetOrdersListUseCase>(),
        ));
    gh.lazySingleton<_i27.ProductRemoteDataSource>(() =>
        _i28.ProductRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i29.ProductRepository>(
        () => _i30.ProductRepositoryImpl(gh<_i27.ProductRemoteDataSource>()));
    gh.lazySingleton<_i31.RemoveProductFromCartUseCase>(
        () => _i31.RemoveProductFromCartUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i32.RemoveProductFromFavoriteListUseCase>(() =>
        _i32.RemoveProductFromFavoriteListUseCase(
            gh<_i29.ProductRepository>()));
    gh.lazySingleton<_i33.ResetPasswordUseCase>(
        () => _i33.ResetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i34.SearchForProductsUseCase>(
        () => _i34.SearchForProductsUseCase(gh<_i29.ProductRepository>()));
    gh.factory<_i35.TokensCubit>(() => _i35.TokensCubit(
          gh<_i13.CheckIfTokensExistUseCase>(),
          gh<_i15.DeleteTokensUseCase>(),
        ));
    gh.lazySingleton<_i36.UpdateUserLocationUseCase>(
        () => _i36.UpdateUserLocationUseCase(gh<_i24.MapRepository>()));
    gh.lazySingleton<_i37.UserLocalDataSource>(
        () => _i37.UserLocalDataSourceImpl());
    gh.lazySingleton<_i38.UserLoginUseCase>(
        () => _i38.UserLoginUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i39.UserRemoteDataSource>(() =>
        _i39.UserRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i40.UserRepository>(() => _i41.UserRepositoryImpl(
          gh<_i37.UserLocalDataSource>(),
          gh<_i39.UserRemoteDataSource>(),
        ));
    gh.lazySingleton<_i42.UserSignUpUseCase>(
        () => _i42.UserSignUpUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i43.VerifyOtpUseCase>(
        () => _i43.VerifyOtpUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i44.AddOrEditProductReviewUseCase>(
        () => _i44.AddOrEditProductReviewUseCase(gh<_i29.ProductRepository>()));
    gh.lazySingleton<_i45.AddProductToCartUseCase>(
        () => _i45.AddProductToCartUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i46.AddProductToFavoriteListUseCase>(() =>
        _i46.AddProductToFavoriteListUseCase(gh<_i29.ProductRepository>()));
    gh.factory<_i47.CartCubit>(() => _i47.CartCubit(
          gh<_i45.AddProductToCartUseCase>(),
          gh<_i31.RemoveProductFromCartUseCase>(),
          gh<_i20.GetCartProductsUseCase>(),
          gh<_i18.EditProductQuantityUseCase>(),
          gh<_i22.GetUserAccessTokenUseCase>(),
          gh<_i14.CreatePaymentIntentUseCase>(),
        ));
    gh.lazySingleton<_i48.ChangeAppThemeUseCase>(() =>
        _i48.ChangeAppThemeUseCase(themeRepository: gh<_i40.UserRepository>()));
    gh.factory<_i49.ChangePasswordCubit>(() => _i49.ChangePasswordCubit(
          gh<_i22.GetUserAccessTokenUseCase>(),
          gh<_i12.ChangePasswordUseCase>(),
        ));
    gh.factory<_i50.ForgetPasswordCubit>(() => _i50.ForgetPasswordCubit(
          gh<_i19.ForgetPasswordUseCase>(),
          gh<_i43.VerifyOtpUseCase>(),
          gh<_i33.ResetPasswordUseCase>(),
        ));
    gh.lazySingleton<_i51.GetAllBrandsProductsUseCase>(
        () => _i51.GetAllBrandsProductsUseCase(gh<_i29.ProductRepository>()));
    gh.lazySingleton<_i52.GetAppThemeUseCase>(() =>
        _i52.GetAppThemeUseCase(themeRepository: gh<_i40.UserRepository>()));
    gh.lazySingleton<_i53.GetBrandProductsUseCase>(
        () => _i53.GetBrandProductsUseCase(gh<_i29.ProductRepository>()));
    gh.lazySingleton<_i54.GetBrandsUseCase>(
        () => _i54.GetBrandsUseCase(gh<_i29.ProductRepository>()));
    gh.lazySingleton<_i55.GetCategoriesUseCase>(
        () => _i55.GetCategoriesUseCase(gh<_i29.ProductRepository>()));
    gh.lazySingleton<_i56.GetFavoriteProductsUseCase>(
        () => _i56.GetFavoriteProductsUseCase(gh<_i29.ProductRepository>()));
    gh.lazySingleton<_i57.GetPlaceLatitudeAndLongitudeUseCase>(() =>
        _i57.GetPlaceLatitudeAndLongitudeUseCase(gh<_i24.MapRepository>()));
    gh.lazySingleton<_i58.GetPlacesSuggestionsUseCase>(
        () => _i58.GetPlacesSuggestionsUseCase(gh<_i24.MapRepository>()));
    gh.lazySingleton<_i59.GetProductDetailsUseCase>(
        () => _i59.GetProductDetailsUseCase(gh<_i29.ProductRepository>()));
    gh.lazySingleton<_i60.GetProductReviewsAndRatingsUseCase>(() =>
        _i60.GetProductReviewsAndRatingsUseCase(gh<_i29.ProductRepository>()));
    gh.lazySingleton<_i61.GetProductsOffersUseCase>(
        () => _i61.GetProductsOffersUseCase(gh<_i29.ProductRepository>()));
    gh.lazySingleton<_i62.GetUserDataUseCase>(
        () => _i62.GetUserDataUseCase(gh<_i40.UserRepository>()));
    gh.lazySingleton<_i63.GetUserFavoriteProductsIdsUseCase>(() =>
        _i63.GetUserFavoriteProductsIdsUseCase(gh<_i29.ProductRepository>()));
    gh.lazySingleton<_i64.GetUserLocationUseCase>(
        () => _i64.GetUserLocationUseCase(gh<_i24.MapRepository>()));
    gh.lazySingleton<_i65.GetUserProductReviewUseCase>(
        () => _i65.GetUserProductReviewUseCase(gh<_i29.ProductRepository>()));
    gh.factory<_i66.HomeBloc>(() => _i66.HomeBloc(
          gh<_i55.GetCategoriesUseCase>(),
          gh<_i61.GetProductsOffersUseCase>(),
          gh<_i54.GetBrandsUseCase>(),
          gh<_i51.GetAllBrandsProductsUseCase>(),
        ));
    gh.factory<_i67.LoginCubit>(
        () => _i67.LoginCubit(gh<_i38.UserLoginUseCase>()));
    gh.factory<_i68.MapBloc>(() => _i68.MapBloc(
          gh<_i58.GetPlacesSuggestionsUseCase>(),
          gh<_i57.GetPlaceLatitudeAndLongitudeUseCase>(),
          gh<_i64.GetUserLocationUseCase>(),
          gh<_i36.UpdateUserLocationUseCase>(),
          gh<_i22.GetUserAccessTokenUseCase>(),
        ));
    gh.factory<_i69.ProfileCubit>(() => _i69.ProfileCubit(
          gh<_i62.GetUserDataUseCase>(),
          gh<_i22.GetUserAccessTokenUseCase>(),
        ));
    gh.factory<_i70.SearchBloc>(
        () => _i70.SearchBloc(gh<_i34.SearchForProductsUseCase>()));
    gh.factory<_i71.SignupCubit>(
        () => _i71.SignupCubit(gh<_i42.UserSignUpUseCase>()));
    gh.factory<_i72.ThemeCubit>(() => _i72.ThemeCubit(
          gh<_i52.GetAppThemeUseCase>(),
          gh<_i48.ChangeAppThemeUseCase>(),
        ));
    gh.factory<_i73.DetailsCubit>(() => _i73.DetailsCubit(
          gh<_i59.GetProductDetailsUseCase>(),
          gh<_i60.GetProductReviewsAndRatingsUseCase>(),
          gh<_i44.AddOrEditProductReviewUseCase>(),
          gh<_i65.GetUserProductReviewUseCase>(),
          gh<_i22.GetUserAccessTokenUseCase>(),
        ));
    gh.factory<_i74.DiscoverBloc>(() => _i74.DiscoverBloc(
          gh<_i53.GetBrandProductsUseCase>(),
          gh<_i61.GetProductsOffersUseCase>(),
        ));
    gh.factory<_i75.FavoriteCubit>(() => _i75.FavoriteCubit(
          gh<_i22.GetUserAccessTokenUseCase>(),
          gh<_i63.GetUserFavoriteProductsIdsUseCase>(),
          gh<_i46.AddProductToFavoriteListUseCase>(),
          gh<_i32.RemoveProductFromFavoriteListUseCase>(),
          gh<_i59.GetProductDetailsUseCase>(),
          gh<_i56.GetFavoriteProductsUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i76.RegisterModule {}

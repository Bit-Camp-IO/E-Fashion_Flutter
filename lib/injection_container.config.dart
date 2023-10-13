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
import 'package:efashion_flutter/components/authComponent/domain/usecases/get_access_token_usecase.dart'
    as _i20;
import 'package:efashion_flutter/components/authComponent/domain/usecases/reset_password_usecase.dart'
    as _i31;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_login_usecase.dart'
    as _i36;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_signup_usecase.dart'
    as _i40;
import 'package:efashion_flutter/components/authComponent/domain/usecases/verify_otp_usecase.dart'
    as _i41;
import 'package:efashion_flutter/components/cartComponent/data/datasources/cart_datasource.dart'
    as _i9;
import 'package:efashion_flutter/components/cartComponent/data/repositories/cart_repository_impl.dart'
    as _i11;
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart'
    as _i10;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/add_product_to_cart_usecase.dart'
    as _i43;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/create_payment_intent_usecase.dart'
    as _i14;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/edit_product_quantity_usecase.dart'
    as _i18;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/get_cart_products_usecase.dart'
    as _i21;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/remove_product_from_cart_usecase.dart'
    as _i29;
import 'package:efashion_flutter/components/mapComponent/data/datasources/map_datasource.dart'
    as _i22;
import 'package:efashion_flutter/components/mapComponent/data/repositories/map_repository_impl.dart'
    as _i24;
import 'package:efashion_flutter/components/mapComponent/domain/repositories/map_repository.dart'
    as _i23;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_place_latitude_and_longitude_usecase.dart'
    as _i55;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_places_suggestions_usecase.dart'
    as _i56;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_user_location_usecase.dart'
    as _i62;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/update_user_location_usecase.dart'
    as _i34;
import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source.dart'
    as _i25;
import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source_impl.dart'
    as _i26;
import 'package:efashion_flutter/components/productComponent/data/repositories/product_repository_impl.dart'
    as _i28;
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart'
    as _i27;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/add_product_to_favorite_list_usecase.dart'
    as _i44;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_favorite_products_usecase.dart'
    as _i54;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_user_favorite_products_ids.dart'
    as _i61;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/remove_product_from_favorite_list_usecase.dart'
    as _i30;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/add_or_edit_product_review_usecase.dart'
    as _i42;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_all_brands_products_usecase.dart'
    as _i49;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brand_products_usecase.dart'
    as _i51;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brands_usecase.dart'
    as _i52;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_categories_usecase.dart'
    as _i53;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_details_usecase.dart'
    as _i57;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_reviews_and_ratings_usecase.dart'
    as _i58;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_products_offers_usecase.dart'
    as _i59;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_user_review_usecase.dart'
    as _i63;
import 'package:efashion_flutter/components/productComponent/domain/usecases/search/search_for_product_usecase.dart'
    as _i32;
import 'package:efashion_flutter/components/userComponent/data/datasources/local/user_local_data_source.dart'
    as _i35;
import 'package:efashion_flutter/components/userComponent/data/datasources/remote/user_remote_data_source.dart'
    as _i37;
import 'package:efashion_flutter/components/userComponent/data/repositories/user_repository_impl.dart'
    as _i39;
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart'
    as _i38;
import 'package:efashion_flutter/components/userComponent/domain/usecases/change_app_theme_usecase.dart'
    as _i46;
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_app_theme_usecase.dart'
    as _i50;
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_user_data_usecase.dart'
    as _i60;
import 'package:efashion_flutter/presentation/account/bloc/account_cubit/account_cubit.dart'
    as _i70;
import 'package:efashion_flutter/presentation/account/bloc/change_password_cubit/change_password_cubit.dart'
    as _i47;
import 'package:efashion_flutter/presentation/account/bloc/maps_bloc/map_bloc.dart'
    as _i66;
import 'package:efashion_flutter/presentation/auth/cubits/forget_password/forget_password_cubit.dart'
    as _i48;
import 'package:efashion_flutter/presentation/auth/cubits/login/login_cubit.dart'
    as _i65;
import 'package:efashion_flutter/presentation/auth/cubits/signup/signup_cubit.dart'
    as _i68;
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart'
    as _i71;
import 'package:efashion_flutter/presentation/product/bloc/discover_cubit/discover_bloc.dart'
    as _i72;
import 'package:efashion_flutter/presentation/product/bloc/favorite_cubit/favorite_cubit.dart'
    as _i73;
import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart'
    as _i64;
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart'
    as _i67;
import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart'
    as _i45;
import 'package:efashion_flutter/presentation/shared/bloc/theme_cubit/theme_cubit.dart'
    as _i69;
import 'package:efashion_flutter/presentation/shared/bloc/tokens_cubit/tokens_cubit.dart'
    as _i33;
import 'package:efashion_flutter/register_module.dart' as _i74;
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
      () => registerModule.mainApiConsumer,
      instanceName: 'mainApiConsumer',
    );
    gh.lazySingleton<_i3.ApiConsumer>(
      () => registerModule.mapsApiConsumer,
      instanceName: 'mapsApiConsumer',
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
    gh.lazySingleton<_i20.GetAccessTokenUseCase>(
        () => _i20.GetAccessTokenUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i21.GetCartProductsUseCase>(
        () => _i21.GetCartProductsUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i22.MapDataSource>(() => _i22.MapDataSourceImpl(
          gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer'),
          gh<_i3.ApiConsumer>(instanceName: 'mapsApiConsumer'),
        ));
    gh.lazySingleton<_i23.MapRepository>(
        () => _i24.MapRepositoryImpl(gh<_i22.MapDataSource>()));
    gh.lazySingleton<_i25.ProductRemoteDataSource>(() =>
        _i26.ProductRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i27.ProductRepository>(
        () => _i28.ProductRepositoryImpl(gh<_i25.ProductRemoteDataSource>()));
    gh.lazySingleton<_i29.RemoveProductFromCartUseCase>(
        () => _i29.RemoveProductFromCartUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i30.RemoveProductFromFavoriteListUseCase>(() =>
        _i30.RemoveProductFromFavoriteListUseCase(
            gh<_i27.ProductRepository>()));
    gh.lazySingleton<_i31.ResetPasswordUseCase>(
        () => _i31.ResetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i32.SearchForProductsUseCase>(
        () => _i32.SearchForProductsUseCase(gh<_i27.ProductRepository>()));
    gh.factory<_i33.TokensCubit>(() => _i33.TokensCubit(
          gh<_i13.CheckIfTokensExistUseCase>(),
          gh<_i15.DeleteTokensUseCase>(),
        ));
    gh.lazySingleton<_i34.UpdateUserLocationUseCase>(
        () => _i34.UpdateUserLocationUseCase(gh<_i23.MapRepository>()));
    gh.lazySingleton<_i35.UserLocalDataSource>(
        () => _i35.UserLocalDataSourceImpl());
    gh.lazySingleton<_i36.UserLoginUseCase>(
        () => _i36.UserLoginUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i37.UserRemoteDataSource>(() =>
        _i37.UserRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i38.UserRepository>(() => _i39.UserRepositoryImpl(
          gh<_i35.UserLocalDataSource>(),
          gh<_i37.UserRemoteDataSource>(),
        ));
    gh.lazySingleton<_i40.UserSignUpUseCase>(
        () => _i40.UserSignUpUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i41.VerifyOtpUseCase>(
        () => _i41.VerifyOtpUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i42.AddOrEditProductReviewUseCase>(
        () => _i42.AddOrEditProductReviewUseCase(gh<_i27.ProductRepository>()));
    gh.lazySingleton<_i43.AddProductToCartUseCase>(
        () => _i43.AddProductToCartUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i44.AddProductToFavoriteListUseCase>(() =>
        _i44.AddProductToFavoriteListUseCase(gh<_i27.ProductRepository>()));
    gh.factory<_i45.CartCubit>(() => _i45.CartCubit(
          gh<_i43.AddProductToCartUseCase>(),
          gh<_i29.RemoveProductFromCartUseCase>(),
          gh<_i21.GetCartProductsUseCase>(),
          gh<_i18.EditProductQuantityUseCase>(),
          gh<_i20.GetAccessTokenUseCase>(),
          gh<_i14.CreatePaymentIntentUseCase>(),
        ));
    gh.lazySingleton<_i46.ChangeAppThemeUseCase>(() =>
        _i46.ChangeAppThemeUseCase(themeRepository: gh<_i38.UserRepository>()));
    gh.factory<_i47.ChangePasswordCubit>(() => _i47.ChangePasswordCubit(
          gh<_i20.GetAccessTokenUseCase>(),
          gh<_i12.ChangePasswordUseCase>(),
        ));
    gh.factory<_i48.ForgetPasswordCubit>(() => _i48.ForgetPasswordCubit(
          gh<_i19.ForgetPasswordUseCase>(),
          gh<_i41.VerifyOtpUseCase>(),
          gh<_i31.ResetPasswordUseCase>(),
        ));
    gh.lazySingleton<_i49.GetAllBrandsProductsUseCase>(
        () => _i49.GetAllBrandsProductsUseCase(gh<_i27.ProductRepository>()));
    gh.lazySingleton<_i50.GetAppThemeUseCase>(() =>
        _i50.GetAppThemeUseCase(themeRepository: gh<_i38.UserRepository>()));
    gh.lazySingleton<_i51.GetBrandProductsUseCase>(
        () => _i51.GetBrandProductsUseCase(gh<_i27.ProductRepository>()));
    gh.lazySingleton<_i52.GetBrandsUseCase>(
        () => _i52.GetBrandsUseCase(gh<_i27.ProductRepository>()));
    gh.lazySingleton<_i53.GetCategoriesUseCase>(
        () => _i53.GetCategoriesUseCase(gh<_i27.ProductRepository>()));
    gh.lazySingleton<_i54.GetFavoriteProductsUseCase>(
        () => _i54.GetFavoriteProductsUseCase(gh<_i27.ProductRepository>()));
    gh.lazySingleton<_i55.GetPlaceLatitudeAndLongitudeUseCase>(() =>
        _i55.GetPlaceLatitudeAndLongitudeUseCase(gh<_i23.MapRepository>()));
    gh.lazySingleton<_i56.GetPlacesSuggestionsUseCase>(
        () => _i56.GetPlacesSuggestionsUseCase(gh<_i23.MapRepository>()));
    gh.lazySingleton<_i57.GetProductDetailsUseCase>(
        () => _i57.GetProductDetailsUseCase(gh<_i27.ProductRepository>()));
    gh.lazySingleton<_i58.GetProductReviewsAndRatingsUseCase>(() =>
        _i58.GetProductReviewsAndRatingsUseCase(gh<_i27.ProductRepository>()));
    gh.lazySingleton<_i59.GetProductsOffersUseCase>(
        () => _i59.GetProductsOffersUseCase(gh<_i27.ProductRepository>()));
    gh.lazySingleton<_i60.GetUserDataUseCase>(
        () => _i60.GetUserDataUseCase(gh<_i38.UserRepository>()));
    gh.lazySingleton<_i61.GetUserFavoriteProductsIdsUseCase>(() =>
        _i61.GetUserFavoriteProductsIdsUseCase(gh<_i27.ProductRepository>()));
    gh.lazySingleton<_i62.GetUserLocationUseCase>(
        () => _i62.GetUserLocationUseCase(gh<_i23.MapRepository>()));
    gh.lazySingleton<_i63.GetUserProductReviewUseCase>(
        () => _i63.GetUserProductReviewUseCase(gh<_i27.ProductRepository>()));
    gh.factory<_i64.HomeBloc>(() => _i64.HomeBloc(
          gh<_i53.GetCategoriesUseCase>(),
          gh<_i59.GetProductsOffersUseCase>(),
          gh<_i52.GetBrandsUseCase>(),
          gh<_i49.GetAllBrandsProductsUseCase>(),
        ));
    gh.factory<_i65.LoginCubit>(
        () => _i65.LoginCubit(gh<_i36.UserLoginUseCase>()));
    gh.factory<_i66.MapBloc>(() => _i66.MapBloc(
          gh<_i56.GetPlacesSuggestionsUseCase>(),
          gh<_i55.GetPlaceLatitudeAndLongitudeUseCase>(),
          gh<_i62.GetUserLocationUseCase>(),
          gh<_i34.UpdateUserLocationUseCase>(),
          gh<_i20.GetAccessTokenUseCase>(),
        ));
    gh.factory<_i67.SearchBloc>(
        () => _i67.SearchBloc(gh<_i32.SearchForProductsUseCase>()));
    gh.factory<_i68.SignupCubit>(
        () => _i68.SignupCubit(gh<_i40.UserSignUpUseCase>()));
    gh.factory<_i69.ThemeCubit>(() => _i69.ThemeCubit(
          gh<_i50.GetAppThemeUseCase>(),
          gh<_i46.ChangeAppThemeUseCase>(),
        ));
    gh.factory<_i70.AccountCubit>(() => _i70.AccountCubit(
          gh<_i60.GetUserDataUseCase>(),
          gh<_i20.GetAccessTokenUseCase>(),
        ));
    gh.factory<_i71.DetailsCubit>(() => _i71.DetailsCubit(
          gh<_i57.GetProductDetailsUseCase>(),
          gh<_i58.GetProductReviewsAndRatingsUseCase>(),
          gh<_i42.AddOrEditProductReviewUseCase>(),
          gh<_i63.GetUserProductReviewUseCase>(),
          gh<_i20.GetAccessTokenUseCase>(),
        ));
    gh.factory<_i72.DiscoverBloc>(() => _i72.DiscoverBloc(
          gh<_i51.GetBrandProductsUseCase>(),
          gh<_i59.GetProductsOffersUseCase>(),
        ));
    gh.factory<_i73.FavoriteCubit>(() => _i73.FavoriteCubit(
          gh<_i20.GetAccessTokenUseCase>(),
          gh<_i61.GetUserFavoriteProductsIdsUseCase>(),
          gh<_i44.AddProductToFavoriteListUseCase>(),
          gh<_i30.RemoveProductFromFavoriteListUseCase>(),
          gh<_i57.GetProductDetailsUseCase>(),
          gh<_i54.GetFavoriteProductsUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i74.RegisterModule {}

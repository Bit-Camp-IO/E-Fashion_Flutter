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
    as _i18;
import 'package:efashion_flutter/components/authComponent/domain/usecases/forget_password_usecase.dart'
    as _i22;
import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart'
    as _i27;
import 'package:efashion_flutter/components/authComponent/domain/usecases/reset_password_usecase.dart'
    as _i38;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_login_usecase.dart'
    as _i43;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_signup_usecase.dart'
    as _i47;
import 'package:efashion_flutter/components/authComponent/domain/usecases/verify_otp_usecase.dart'
    as _i48;
import 'package:efashion_flutter/components/cartComponent/data/datasources/cart_datasource.dart'
    as _i9;
import 'package:efashion_flutter/components/cartComponent/data/repositories/cart_repository_impl.dart'
    as _i11;
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart'
    as _i10;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/add_product_to_cart_usecase.dart'
    as _i50;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/create_payment_intent_usecase.dart'
    as _i17;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/edit_product_quantity_usecase.dart'
    as _i21;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/get_cart_products_usecase.dart'
    as _i23;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/get_orders_list_usecase.dart'
    as _i26;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/remove_product_from_cart_usecase.dart'
    as _i36;
import 'package:efashion_flutter/components/collectionComponent/data/datasources/collection_remote_datasource.dart'
    as _i14;
import 'package:efashion_flutter/components/collectionComponent/data/repositories/collection_repository_impl.dart'
    as _i16;
import 'package:efashion_flutter/components/collectionComponent/domain/repositories/collection_repository.dart'
    as _i15;
import 'package:efashion_flutter/components/collectionComponent/domain/usecases/get_collection_items_list_usecase.dart'
    as _i24;
import 'package:efashion_flutter/components/collectionComponent/domain/usecases/get_collections_list_usecase.dart'
    as _i25;
import 'package:efashion_flutter/components/mapComponent/data/datasources/map_datasource.dart'
    as _i28;
import 'package:efashion_flutter/components/mapComponent/data/repositories/map_repository_impl.dart'
    as _i30;
import 'package:efashion_flutter/components/mapComponent/domain/repositories/map_repository.dart'
    as _i29;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_place_latitude_and_longitude_usecase.dart'
    as _i63;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_places_suggestions_usecase.dart'
    as _i64;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_user_location_usecase.dart'
    as _i70;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/update_user_location_usecase.dart'
    as _i41;
import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source.dart'
    as _i32;
import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source_impl.dart'
    as _i33;
import 'package:efashion_flutter/components/productComponent/data/repositories/product_repository_impl.dart'
    as _i35;
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart'
    as _i34;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/add_product_to_favorite_list_usecase.dart'
    as _i51;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_favorite_products_usecase.dart'
    as _i62;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_user_favorite_products_ids.dart'
    as _i69;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/remove_product_from_favorite_list_usecase.dart'
    as _i37;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/add_or_edit_product_review_usecase.dart'
    as _i49;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_all_brands_products_usecase.dart'
    as _i57;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brand_products_usecase.dart'
    as _i59;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brands_usecase.dart'
    as _i60;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_categories_usecase.dart'
    as _i61;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_details_usecase.dart'
    as _i65;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_reviews_and_ratings_usecase.dart'
    as _i66;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_products_offers_usecase.dart'
    as _i67;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_user_review_usecase.dart'
    as _i71;
import 'package:efashion_flutter/components/productComponent/domain/usecases/search/search_for_product_usecase.dart'
    as _i39;
import 'package:efashion_flutter/components/userComponent/data/datasources/local/user_local_data_source.dart'
    as _i42;
import 'package:efashion_flutter/components/userComponent/data/datasources/remote/user_remote_data_source.dart'
    as _i44;
import 'package:efashion_flutter/components/userComponent/data/repositories/user_repository_impl.dart'
    as _i46;
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart'
    as _i45;
import 'package:efashion_flutter/components/userComponent/domain/usecases/change_app_theme_usecase.dart'
    as _i53;
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_app_theme_usecase.dart'
    as _i58;
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_user_data_usecase.dart'
    as _i68;
import 'package:efashion_flutter/components/userComponent/domain/usecases/update_profile_picture_usecase.dart'
    as _i78;
import 'package:efashion_flutter/components/userComponent/domain/usecases/update_user_data_usecase.dart'
    as _i79;
import 'package:efashion_flutter/presentation/account/bloc/change_password_cubit/change_password_cubit.dart'
    as _i54;
import 'package:efashion_flutter/presentation/account/bloc/maps_bloc/map_bloc.dart'
    as _i74;
import 'package:efashion_flutter/presentation/account/bloc/orders_cubit/orders_cubit.dart'
    as _i31;
import 'package:efashion_flutter/presentation/account/bloc/profile_cubit/profile_cubit.dart'
    as _i83;
import 'package:efashion_flutter/presentation/auth/cubits/forget_password/forget_password_cubit.dart'
    as _i56;
import 'package:efashion_flutter/presentation/auth/cubits/login/login_cubit.dart'
    as _i73;
import 'package:efashion_flutter/presentation/auth/cubits/signup/signup_cubit.dart'
    as _i76;
import 'package:efashion_flutter/presentation/product/bloc/collections_cubit/collections_cubit.dart'
    as _i55;
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart'
    as _i80;
import 'package:efashion_flutter/presentation/product/bloc/discover_cubit/discover_bloc.dart'
    as _i81;
import 'package:efashion_flutter/presentation/product/bloc/favorite_cubit/favorite_cubit.dart'
    as _i82;
import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart'
    as _i72;
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart'
    as _i75;
import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart'
    as _i52;
import 'package:efashion_flutter/presentation/shared/bloc/theme_cubit/theme_cubit.dart'
    as _i77;
import 'package:efashion_flutter/presentation/shared/bloc/tokens_cubit/tokens_cubit.dart'
    as _i40;
import 'package:efashion_flutter/register_module.dart' as _i84;
import 'package:efashion_flutter/shared/api/api_consumer.dart' as _i3;
import 'package:efashion_flutter/shared/api/dio_interceptor.dart' as _i19;
import 'package:efashion_flutter/shared/api/dio_logger.dart' as _i20;
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
    gh.lazySingleton<_i14.CollectionRemoteDataSource>(() =>
        _i14.CollectionRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i15.CollectionRepository>(() =>
        _i16.CollectionRepositoryImpl(gh<_i14.CollectionRemoteDataSource>()));
    gh.lazySingleton<_i17.CreatePaymentIntentUseCase>(
        () => _i17.CreatePaymentIntentUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i18.DeleteTokensUseCase>(
        () => _i18.DeleteTokensUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i19.DioInterceptor>(() => _i19.DioInterceptor());
    gh.lazySingleton<_i20.DioLogInterceptor>(() => _i20.DioLogInterceptor());
    gh.lazySingleton<_i21.EditProductQuantityUseCase>(
        () => _i21.EditProductQuantityUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i22.ForgetPasswordUseCase>(
        () => _i22.ForgetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i23.GetCartProductsUseCase>(
        () => _i23.GetCartProductsUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i24.GetCollectionItemsListUseCase>(() =>
        _i24.GetCollectionItemsListUseCase(gh<_i15.CollectionRepository>()));
    gh.lazySingleton<_i25.GetCollectionsListUseCase>(
        () => _i25.GetCollectionsListUseCase(gh<_i15.CollectionRepository>()));
    gh.lazySingleton<_i26.GetOrdersListUseCase>(
        () => _i26.GetOrdersListUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i27.GetUserAccessTokenUseCase>(
        () => _i27.GetUserAccessTokenUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i28.MapDataSource>(() => _i28.MapDataSourceImpl(
          gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer'),
          gh<_i3.ApiConsumer>(instanceName: 'mapsApiConsumer'),
        ));
    gh.lazySingleton<_i29.MapRepository>(
        () => _i30.MapRepositoryImpl(gh<_i28.MapDataSource>()));
    gh.factory<_i31.OrdersCubit>(() => _i31.OrdersCubit(
          gh<_i27.GetUserAccessTokenUseCase>(),
          gh<_i26.GetOrdersListUseCase>(),
        ));
    gh.lazySingleton<_i32.ProductRemoteDataSource>(() =>
        _i33.ProductRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i34.ProductRepository>(
        () => _i35.ProductRepositoryImpl(gh<_i32.ProductRemoteDataSource>()));
    gh.lazySingleton<_i36.RemoveProductFromCartUseCase>(
        () => _i36.RemoveProductFromCartUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i37.RemoveProductFromFavoriteListUseCase>(() =>
        _i37.RemoveProductFromFavoriteListUseCase(
            gh<_i34.ProductRepository>()));
    gh.lazySingleton<_i38.ResetPasswordUseCase>(
        () => _i38.ResetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i39.SearchForProductsUseCase>(
        () => _i39.SearchForProductsUseCase(gh<_i34.ProductRepository>()));
    gh.factory<_i40.TokensCubit>(() => _i40.TokensCubit(
          gh<_i13.CheckIfTokensExistUseCase>(),
          gh<_i18.DeleteTokensUseCase>(),
        ));
    gh.lazySingleton<_i41.UpdateUserLocationUseCase>(
        () => _i41.UpdateUserLocationUseCase(gh<_i29.MapRepository>()));
    gh.lazySingleton<_i42.UserLocalDataSource>(
        () => _i42.UserLocalDataSourceImpl());
    gh.lazySingleton<_i43.UserLoginUseCase>(
        () => _i43.UserLoginUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i44.UserRemoteDataSource>(() =>
        _i44.UserRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i45.UserRepository>(() => _i46.UserRepositoryImpl(
          gh<_i42.UserLocalDataSource>(),
          gh<_i44.UserRemoteDataSource>(),
        ));
    gh.lazySingleton<_i47.UserSignUpUseCase>(
        () => _i47.UserSignUpUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i48.VerifyOtpUseCase>(
        () => _i48.VerifyOtpUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i49.AddOrEditProductReviewUseCase>(
        () => _i49.AddOrEditProductReviewUseCase(gh<_i34.ProductRepository>()));
    gh.lazySingleton<_i50.AddProductToCartUseCase>(
        () => _i50.AddProductToCartUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i51.AddProductToFavoriteListUseCase>(() =>
        _i51.AddProductToFavoriteListUseCase(gh<_i34.ProductRepository>()));
    gh.factory<_i52.CartCubit>(() => _i52.CartCubit(
          gh<_i50.AddProductToCartUseCase>(),
          gh<_i36.RemoveProductFromCartUseCase>(),
          gh<_i23.GetCartProductsUseCase>(),
          gh<_i21.EditProductQuantityUseCase>(),
          gh<_i27.GetUserAccessTokenUseCase>(),
          gh<_i17.CreatePaymentIntentUseCase>(),
        ));
    gh.lazySingleton<_i53.ChangeAppThemeUseCase>(() =>
        _i53.ChangeAppThemeUseCase(themeRepository: gh<_i45.UserRepository>()));
    gh.factory<_i54.ChangePasswordCubit>(() => _i54.ChangePasswordCubit(
          gh<_i27.GetUserAccessTokenUseCase>(),
          gh<_i12.ChangePasswordUseCase>(),
        ));
    gh.factory<_i55.CollectionsCubit>(() => _i55.CollectionsCubit(
          gh<_i27.GetUserAccessTokenUseCase>(),
          gh<_i25.GetCollectionsListUseCase>(),
          gh<_i24.GetCollectionItemsListUseCase>(),
          gh<_i17.CreatePaymentIntentUseCase>(),
        ));
    gh.factory<_i56.ForgetPasswordCubit>(() => _i56.ForgetPasswordCubit(
          gh<_i22.ForgetPasswordUseCase>(),
          gh<_i48.VerifyOtpUseCase>(),
          gh<_i38.ResetPasswordUseCase>(),
        ));
    gh.lazySingleton<_i57.GetAllBrandsProductsUseCase>(
        () => _i57.GetAllBrandsProductsUseCase(gh<_i34.ProductRepository>()));
    gh.lazySingleton<_i58.GetAppThemeUseCase>(() =>
        _i58.GetAppThemeUseCase(themeRepository: gh<_i45.UserRepository>()));
    gh.lazySingleton<_i59.GetBrandProductsUseCase>(
        () => _i59.GetBrandProductsUseCase(gh<_i34.ProductRepository>()));
    gh.lazySingleton<_i60.GetBrandsUseCase>(
        () => _i60.GetBrandsUseCase(gh<_i34.ProductRepository>()));
    gh.lazySingleton<_i61.GetCategoriesUseCase>(
        () => _i61.GetCategoriesUseCase(gh<_i34.ProductRepository>()));
    gh.lazySingleton<_i62.GetFavoriteProductsUseCase>(
        () => _i62.GetFavoriteProductsUseCase(gh<_i34.ProductRepository>()));
    gh.lazySingleton<_i63.GetPlaceLatitudeAndLongitudeUseCase>(() =>
        _i63.GetPlaceLatitudeAndLongitudeUseCase(gh<_i29.MapRepository>()));
    gh.lazySingleton<_i64.GetPlacesSuggestionsUseCase>(
        () => _i64.GetPlacesSuggestionsUseCase(gh<_i29.MapRepository>()));
    gh.lazySingleton<_i65.GetProductDetailsUseCase>(
        () => _i65.GetProductDetailsUseCase(gh<_i34.ProductRepository>()));
    gh.lazySingleton<_i66.GetProductReviewsAndRatingsUseCase>(() =>
        _i66.GetProductReviewsAndRatingsUseCase(gh<_i34.ProductRepository>()));
    gh.lazySingleton<_i67.GetProductsOffersUseCase>(
        () => _i67.GetProductsOffersUseCase(gh<_i34.ProductRepository>()));
    gh.lazySingleton<_i68.GetUserDataUseCase>(
        () => _i68.GetUserDataUseCase(gh<_i45.UserRepository>()));
    gh.lazySingleton<_i69.GetUserFavoriteProductsIdsUseCase>(() =>
        _i69.GetUserFavoriteProductsIdsUseCase(gh<_i34.ProductRepository>()));
    gh.lazySingleton<_i70.GetUserLocationUseCase>(
        () => _i70.GetUserLocationUseCase(gh<_i29.MapRepository>()));
    gh.lazySingleton<_i71.GetUserProductReviewUseCase>(
        () => _i71.GetUserProductReviewUseCase(gh<_i34.ProductRepository>()));
    gh.factory<_i72.HomeBloc>(() => _i72.HomeBloc(
          gh<_i61.GetCategoriesUseCase>(),
          gh<_i67.GetProductsOffersUseCase>(),
          gh<_i60.GetBrandsUseCase>(),
          gh<_i57.GetAllBrandsProductsUseCase>(),
        ));
    gh.factory<_i73.LoginCubit>(
        () => _i73.LoginCubit(gh<_i43.UserLoginUseCase>()));
    gh.factory<_i74.MapBloc>(() => _i74.MapBloc(
          gh<_i64.GetPlacesSuggestionsUseCase>(),
          gh<_i63.GetPlaceLatitudeAndLongitudeUseCase>(),
          gh<_i70.GetUserLocationUseCase>(),
          gh<_i41.UpdateUserLocationUseCase>(),
          gh<_i27.GetUserAccessTokenUseCase>(),
        ));
    gh.factory<_i75.SearchBloc>(
        () => _i75.SearchBloc(gh<_i39.SearchForProductsUseCase>()));
    gh.factory<_i76.SignupCubit>(
        () => _i76.SignupCubit(gh<_i47.UserSignUpUseCase>()));
    gh.factory<_i77.ThemeCubit>(() => _i77.ThemeCubit(
          gh<_i58.GetAppThemeUseCase>(),
          gh<_i53.ChangeAppThemeUseCase>(),
        ));
    gh.lazySingleton<_i78.UpdateProfilePictureUseCase>(
        () => _i78.UpdateProfilePictureUseCase(gh<_i45.UserRepository>()));
    gh.lazySingleton<_i79.UpdateUserDataUseCase>(
        () => _i79.UpdateUserDataUseCase(gh<_i45.UserRepository>()));
    gh.factory<_i80.DetailsCubit>(() => _i80.DetailsCubit(
          gh<_i65.GetProductDetailsUseCase>(),
          gh<_i66.GetProductReviewsAndRatingsUseCase>(),
          gh<_i49.AddOrEditProductReviewUseCase>(),
          gh<_i71.GetUserProductReviewUseCase>(),
          gh<_i27.GetUserAccessTokenUseCase>(),
        ));
    gh.factory<_i81.DiscoverBloc>(() => _i81.DiscoverBloc(
          gh<_i59.GetBrandProductsUseCase>(),
          gh<_i67.GetProductsOffersUseCase>(),
        ));
    gh.factory<_i82.FavoriteCubit>(() => _i82.FavoriteCubit(
          gh<_i27.GetUserAccessTokenUseCase>(),
          gh<_i69.GetUserFavoriteProductsIdsUseCase>(),
          gh<_i51.AddProductToFavoriteListUseCase>(),
          gh<_i37.RemoveProductFromFavoriteListUseCase>(),
          gh<_i65.GetProductDetailsUseCase>(),
          gh<_i62.GetFavoriteProductsUseCase>(),
        ));
    gh.factory<_i83.ProfileCubit>(() => _i83.ProfileCubit(
          gh<_i68.GetUserDataUseCase>(),
          gh<_i27.GetUserAccessTokenUseCase>(),
          gh<_i78.UpdateProfilePictureUseCase>(),
          gh<_i79.UpdateUserDataUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i84.RegisterModule {}

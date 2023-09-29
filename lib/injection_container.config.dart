// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
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
import 'package:efashion_flutter/components/authComponent/domain/usecases/check_if_tokens_exist_use_case.dart'
    as _i9;
import 'package:efashion_flutter/components/authComponent/domain/usecases/delete_tokens_use_case.dart'
    as _i10;
import 'package:efashion_flutter/components/authComponent/domain/usecases/forget_password_usecase.dart'
    as _i14;
import 'package:efashion_flutter/components/authComponent/domain/usecases/get_access_token_usecase.dart'
    as _i15;
import 'package:efashion_flutter/components/authComponent/domain/usecases/reset_password_usecase.dart'
    as _i24;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_login_usecase.dart'
    as _i28;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_signup_usecase.dart'
    as _i32;
import 'package:efashion_flutter/components/authComponent/domain/usecases/verify_otp_usecase.dart'
    as _i33;
import 'package:efashion_flutter/components/mapComponent/datasource/datasources/map_datasource.dart'
    as _i16;
import 'package:efashion_flutter/components/mapComponent/datasource/repositories/map_repository_impl.dart'
    as _i18;
import 'package:efashion_flutter/components/mapComponent/domain/repositories/map_repository.dart'
    as _i17;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_place_latitude_and_longitude_usecase.dart'
    as _i44;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_places_suggestions_usecase.dart'
    as _i45;
import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source.dart'
    as _i19;
import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source_impl.dart'
    as _i20;
import 'package:efashion_flutter/components/productComponent/data/repositories/product_repository_impl.dart'
    as _i22;
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart'
    as _i21;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/add_product_to_favorite_list_usecase.dart'
    as _i35;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_favorite_products_usecase.dart'
    as _i43;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_user_favorite_products_ids.dart'
    as _i50;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/remove_product_from_favorite_list_usecase.dart'
    as _i23;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/add_or_edit_product_review_usecase.dart'
    as _i34;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_all_brands_products_usecase.dart'
    as _i38;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brand_products_usecase.dart'
    as _i40;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brands_usecase.dart'
    as _i41;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_categories_usecase.dart'
    as _i42;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_details_usecase.dart'
    as _i46;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_reviews_and_ratings_usecase.dart'
    as _i47;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_products_offers_usecase.dart'
    as _i48;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_user_review_usecase.dart'
    as _i51;
import 'package:efashion_flutter/components/productComponent/domain/usecases/search/search_for_product_usecase.dart'
    as _i25;
import 'package:efashion_flutter/components/userComponent/data/datasources/local/user_local_data_source.dart'
    as _i27;
import 'package:efashion_flutter/components/userComponent/data/datasources/remote/user_remote_data_source.dart'
    as _i29;
import 'package:efashion_flutter/components/userComponent/data/repositories/user_repository_impl.dart'
    as _i31;
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart'
    as _i30;
import 'package:efashion_flutter/components/userComponent/domain/usecases/change_app_theme_usecase.dart'
    as _i36;
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_app_theme_usecase.dart'
    as _i39;
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_user_data_usecase.dart'
    as _i49;
import 'package:efashion_flutter/presentation/account/bloc/maps_bloc/map_bloc.dart'
    as _i54;
import 'package:efashion_flutter/presentation/auth/cubits/forget_password/forget_password_cubit.dart'
    as _i37;
import 'package:efashion_flutter/presentation/auth/cubits/login/login_cubit.dart'
    as _i53;
import 'package:efashion_flutter/presentation/auth/cubits/signup/signup_cubit.dart'
    as _i56;
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart'
    as _i58;
import 'package:efashion_flutter/presentation/product/bloc/discover_cubit/discover_bloc.dart'
    as _i59;
import 'package:efashion_flutter/presentation/product/bloc/favorite_cubit/favorite_cubit.dart'
    as _i60;
import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart'
    as _i52;
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart'
    as _i55;
import 'package:efashion_flutter/presentation/shared/bloc/theme_cubit/theme_cubit.dart'
    as _i57;
import 'package:efashion_flutter/presentation/shared/bloc/tokens_cubit/tokens_cubit.dart'
    as _i26;
import 'package:efashion_flutter/register_module.dart' as _i61;
import 'package:efashion_flutter/shared/api/api_consumer.dart' as _i3;
import 'package:efashion_flutter/shared/api/dio_interceptor.dart' as _i12;
import 'package:efashion_flutter/shared/api/dio_logger.dart' as _i13;
import 'package:efashion_flutter/shared/api/dio_map_interceptor.dart' as _i11;
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
    gh.lazySingleton<_i9.CheckIfTokensExistUseCase>(
        () => _i9.CheckIfTokensExistUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i10.DeleteTokensUseCase>(
        () => _i10.DeleteTokensUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i11.DioInterceptor>(() => _i11.DioInterceptor());
    gh.lazySingleton<_i12.DioInterceptor>(() => _i12.DioInterceptor());
    gh.lazySingleton<_i13.DioLogInterceptor>(() => _i13.DioLogInterceptor());
    gh.lazySingleton<_i14.ForgetPasswordUseCase>(
        () => _i14.ForgetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i15.GetAccessTokenUseCase>(
        () => _i15.GetAccessTokenUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i16.MapDataSource>(() => _i16.MapDataSourceImpl(
          gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer'),
          gh<_i3.ApiConsumer>(instanceName: 'mapsApiConsumer'),
        ));
    gh.lazySingleton<_i17.MapRepository>(
        () => _i18.MapRepositoryImpl(gh<_i16.MapDataSource>()));
    gh.lazySingleton<_i19.ProductRemoteDataSource>(() =>
        _i20.ProductRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i21.ProductRepository>(
        () => _i22.ProductRepositoryImpl(gh<_i19.ProductRemoteDataSource>()));
    gh.lazySingleton<_i23.RemoveProductFromFavoriteListUseCase>(() =>
        _i23.RemoveProductFromFavoriteListUseCase(
            gh<_i21.ProductRepository>()));
    gh.lazySingleton<_i24.ResetPasswordUseCase>(
        () => _i24.ResetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i25.SearchForProductsUseCase>(
        () => _i25.SearchForProductsUseCase(gh<_i21.ProductRepository>()));
    gh.factory<_i26.TokensCubit>(() => _i26.TokensCubit(
          gh<_i9.CheckIfTokensExistUseCase>(),
          gh<_i10.DeleteTokensUseCase>(),
        ));
    gh.lazySingleton<_i27.UserLocalDataSource>(
        () => _i27.UserLocalDataSourceImpl());
    gh.lazySingleton<_i28.UserLoginUseCase>(
        () => _i28.UserLoginUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i29.UserRemoteDataSource>(() =>
        _i29.UserRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i30.UserRepository>(() => _i31.UserRepositoryImpl(
          gh<_i27.UserLocalDataSource>(),
          gh<_i29.UserRemoteDataSource>(),
        ));
    gh.lazySingleton<_i32.UserSignUpUseCase>(
        () => _i32.UserSignUpUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i33.VerifyOtpUseCase>(
        () => _i33.VerifyOtpUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i34.AddOrEditProductReviewUseCase>(
        () => _i34.AddOrEditProductReviewUseCase(gh<_i21.ProductRepository>()));
    gh.lazySingleton<_i35.AddProductToFavoriteListUseCase>(() =>
        _i35.AddProductToFavoriteListUseCase(gh<_i21.ProductRepository>()));
    gh.lazySingleton<_i36.ChangeAppThemeUseCase>(() =>
        _i36.ChangeAppThemeUseCase(themeRepository: gh<_i30.UserRepository>()));
    gh.factory<_i37.ForgetPasswordCubit>(() => _i37.ForgetPasswordCubit(
          gh<_i14.ForgetPasswordUseCase>(),
          gh<_i33.VerifyOtpUseCase>(),
          gh<_i24.ResetPasswordUseCase>(),
        ));
    gh.lazySingleton<_i38.GetAllBrandsProductsUseCase>(
        () => _i38.GetAllBrandsProductsUseCase(gh<_i21.ProductRepository>()));
    gh.lazySingleton<_i39.GetAppThemeUseCase>(() =>
        _i39.GetAppThemeUseCase(themeRepository: gh<_i30.UserRepository>()));
    gh.lazySingleton<_i40.GetBrandProductsUseCase>(
        () => _i40.GetBrandProductsUseCase(gh<_i21.ProductRepository>()));
    gh.lazySingleton<_i41.GetBrandsUseCase>(
        () => _i41.GetBrandsUseCase(gh<_i21.ProductRepository>()));
    gh.lazySingleton<_i42.GetCategoriesUseCase>(
        () => _i42.GetCategoriesUseCase(gh<_i21.ProductRepository>()));
    gh.lazySingleton<_i43.GetFavoriteProductsUseCase>(
        () => _i43.GetFavoriteProductsUseCase(gh<_i21.ProductRepository>()));
    gh.lazySingleton<_i44.GetPlaceLatitudeAndLongitudeUseCase>(() =>
        _i44.GetPlaceLatitudeAndLongitudeUseCase(gh<_i17.MapRepository>()));
    gh.lazySingleton<_i45.GetPlacesSuggestionsUseCase>(
        () => _i45.GetPlacesSuggestionsUseCase(gh<_i17.MapRepository>()));
    gh.lazySingleton<_i46.GetProductDetailsUseCase>(
        () => _i46.GetProductDetailsUseCase(gh<_i21.ProductRepository>()));
    gh.lazySingleton<_i47.GetProductReviewsAndRatingsUseCase>(() =>
        _i47.GetProductReviewsAndRatingsUseCase(gh<_i21.ProductRepository>()));
    gh.lazySingleton<_i48.GetProductsOffersUseCase>(
        () => _i48.GetProductsOffersUseCase(gh<_i21.ProductRepository>()));
    gh.lazySingleton<_i49.GetUserDataUseCase>(
        () => _i49.GetUserDataUseCase(gh<_i30.UserRepository>()));
    gh.lazySingleton<_i50.GetUserFavoriteProductsIdsUseCase>(() =>
        _i50.GetUserFavoriteProductsIdsUseCase(gh<_i21.ProductRepository>()));
    gh.lazySingleton<_i51.GetUserProductReviewUseCase>(
        () => _i51.GetUserProductReviewUseCase(gh<_i21.ProductRepository>()));
    gh.factory<_i52.HomeBloc>(() => _i52.HomeBloc(
          gh<_i42.GetCategoriesUseCase>(),
          gh<_i48.GetProductsOffersUseCase>(),
          gh<_i41.GetBrandsUseCase>(),
          gh<_i38.GetAllBrandsProductsUseCase>(),
        ));
    gh.factory<_i53.LoginCubit>(
        () => _i53.LoginCubit(gh<_i28.UserLoginUseCase>()));
    gh.factory<_i54.MapBloc>(() => _i54.MapBloc(
          gh<_i45.GetPlacesSuggestionsUseCase>(),
          gh<_i44.GetPlaceLatitudeAndLongitudeUseCase>(),
        ));
    gh.factory<_i55.SearchBloc>(
        () => _i55.SearchBloc(gh<_i25.SearchForProductsUseCase>()));
    gh.factory<_i56.SignupCubit>(
        () => _i56.SignupCubit(gh<_i32.UserSignUpUseCase>()));
    gh.factory<_i57.ThemeCubit>(() => _i57.ThemeCubit(
          gh<_i39.GetAppThemeUseCase>(),
          gh<_i36.ChangeAppThemeUseCase>(),
        ));
    gh.factory<_i58.DetailsCubit>(() => _i58.DetailsCubit(
          gh<_i46.GetProductDetailsUseCase>(),
          gh<_i47.GetProductReviewsAndRatingsUseCase>(),
          gh<_i34.AddOrEditProductReviewUseCase>(),
          gh<_i51.GetUserProductReviewUseCase>(),
          gh<_i15.GetAccessTokenUseCase>(),
          gh<_i49.GetUserDataUseCase>(),
        ));
    gh.factory<_i59.DiscoverBloc>(() => _i59.DiscoverBloc(
          gh<_i40.GetBrandProductsUseCase>(),
          gh<_i48.GetProductsOffersUseCase>(),
        ));
    gh.singleton<_i60.FavoriteCubit>(_i60.FavoriteCubit(
      gh<_i15.GetAccessTokenUseCase>(),
      gh<_i50.GetUserFavoriteProductsIdsUseCase>(),
      gh<_i35.AddProductToFavoriteListUseCase>(),
      gh<_i23.RemoveProductFromFavoriteListUseCase>(),
      gh<_i46.GetProductDetailsUseCase>(),
      gh<_i43.GetFavoriteProductsUseCase>(),
    ));
    return this;
  }
}

class _$RegisterModule extends _i61.RegisterModule {}

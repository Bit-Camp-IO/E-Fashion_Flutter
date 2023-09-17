// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:efashion_flutter/components/authComponent/data/datasources/local/auth_local_data_source.dart'
    as _i4;
import 'package:efashion_flutter/components/authComponent/data/datasources/remote/auth_data_source.dart'
    as _i13;
import 'package:efashion_flutter/components/authComponent/data/repositories/auth_repository_impl.dart'
    as _i15;
import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart'
    as _i14;
import 'package:efashion_flutter/components/authComponent/domain/usecases/check_if_tokens_exist_use_case.dart'
    as _i17;
import 'package:efashion_flutter/components/authComponent/domain/usecases/delete_tokens_use_case.dart'
    as _i18;
import 'package:efashion_flutter/components/authComponent/domain/usecases/get_access_token_usecase.dart'
    as _i19;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_login_usecase.dart'
    as _i27;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_signup_usecase.dart'
    as _i28;
import 'package:efashion_flutter/components/productComponent/data/datasources/home_remote_data_source.dart'
    as _i21;
import 'package:efashion_flutter/components/productComponent/data/repositories/product_repository_impl.dart'
    as _i23;
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart'
    as _i22;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/add_product_to_favorite_list_usecase.dart'
    as _i29;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_user_favorite_list_usecase.dart'
    as _i36;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/remove_product_from_favorite_list_usecase.dart'
    as _i24;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_all_brands_products_usecase.dart'
    as _i30;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brand_products_usecase.dart'
    as _i31;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brands_usecase.dart'
    as _i32;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_categories_usecase.dart'
    as _i33;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_details_usecase.dart'
    as _i34;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_products_offers_usecase.dart'
    as _i35;
import 'package:efashion_flutter/components/userComponent/data/datasources/local/user_local_data_source.dart'
    as _i8;
import 'package:efashion_flutter/components/userComponent/data/repositories/theme_repository_impl.dart'
    as _i10;
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart'
    as _i9;
import 'package:efashion_flutter/components/userComponent/domain/usecases/change_app_theme_usecase.dart'
    as _i16;
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_app_theme_usecase.dart'
    as _i20;
import 'package:efashion_flutter/core/api/api_consumer.dart' as _i11;
import 'package:efashion_flutter/core/api/dio_consumer.dart' as _i12;
import 'package:efashion_flutter/core/api/dio_interceptor.dart' as _i6;
import 'package:efashion_flutter/core/api/dio_logger.dart' as _i7;
import 'package:efashion_flutter/core/router/app_router.dart' as _i3;
import 'package:efashion_flutter/presentation/auth/cubits/login/login_cubit.dart'
    as _i38;
import 'package:efashion_flutter/presentation/auth/cubits/signup/signup_cubit.dart'
    as _i39;
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart'
    as _i40;
import 'package:efashion_flutter/presentation/product/bloc/discover_cubit/discover_cubit.dart'
    as _i41;
import 'package:efashion_flutter/presentation/product/bloc/favorite_cubit/favorite_cubit.dart'
    as _i42;
import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart'
    as _i37;
import 'package:efashion_flutter/presentation/shared/bloc/theme_cubit/theme_cubit.dart'
    as _i25;
import 'package:efashion_flutter/presentation/shared/bloc/tokens_cubit/tokens_cubit.dart'
    as _i26;
import 'package:efashion_flutter/register_module.dart' as _i43;
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
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    gh.lazySingleton<_i4.AuthLocalDataSource>(
        () => _i4.AuthLocalDataSourceImpl());
    gh.lazySingleton<_i5.Dio>(() => registerModule.dioClient);
    gh.lazySingleton<_i6.DioInterceptor>(() => _i6.DioInterceptor());
    gh.lazySingleton<_i7.DioLogInterceptor>(() => _i7.DioLogInterceptor());
    gh.lazySingleton<_i8.UserLocalDataSource>(
        () => _i8.UserLocalDataSourceImpl());
    gh.lazySingleton<_i9.UserRepository>(() => _i10.UserRepositoryImpl(
        userLocalDataSource: gh<_i8.UserLocalDataSource>()));
    gh.lazySingleton<_i11.ApiConsumer>(
        () => _i12.DioApiConsumer(dioClient: gh<_i5.Dio>()));
    gh.lazySingleton<_i13.AuthDataSource>(
        () => _i13.AuthDataSourceImpl(gh<_i11.ApiConsumer>()));
    gh.lazySingleton<_i14.AuthRepository>(() => _i15.AuthRepositoryImpl(
          gh<_i13.AuthDataSource>(),
          gh<_i4.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i16.ChangeAppThemeUseCase>(() =>
        _i16.ChangeAppThemeUseCase(themeRepository: gh<_i9.UserRepository>()));
    gh.lazySingleton<_i17.CheckIfTokensExistUseCase>(
        () => _i17.CheckIfTokensExistUseCase(gh<_i14.AuthRepository>()));
    gh.lazySingleton<_i18.DeleteTokensUseCase>(
        () => _i18.DeleteTokensUseCase(gh<_i14.AuthRepository>()));
    gh.lazySingleton<_i19.GetAccessTokenUseCase>(
        () => _i19.GetAccessTokenUseCase(gh<_i14.AuthRepository>()));
    gh.lazySingleton<_i20.GetAppThemeUseCase>(() =>
        _i20.GetAppThemeUseCase(themeRepository: gh<_i9.UserRepository>()));
    gh.lazySingleton<_i21.HomeRemoteDataSource>(
        () => _i21.HomeRemoteDataSourceImpl(gh<_i11.ApiConsumer>()));
    gh.lazySingleton<_i22.ProductRepository>(
        () => _i23.ProductRepositoryImpl(gh<_i21.HomeRemoteDataSource>()));
    gh.lazySingleton<_i24.RemoveProductFromFavoriteListUseCase>(() =>
        _i24.RemoveProductFromFavoriteListUseCase(
            gh<_i22.ProductRepository>()));
    gh.factory<_i25.ThemeCubit>(() => _i25.ThemeCubit(
          gh<_i20.GetAppThemeUseCase>(),
          gh<_i16.ChangeAppThemeUseCase>(),
        ));
    gh.factory<_i26.TokensCubit>(() => _i26.TokensCubit(
          gh<_i17.CheckIfTokensExistUseCase>(),
          gh<_i18.DeleteTokensUseCase>(),
        ));
    gh.lazySingleton<_i27.UserLoginUseCase>(
        () => _i27.UserLoginUseCase(authRepository: gh<_i14.AuthRepository>()));
    gh.lazySingleton<_i28.UserSignUpUseCase>(() =>
        _i28.UserSignUpUseCase(authRepository: gh<_i14.AuthRepository>()));
    gh.lazySingleton<_i29.AddProductToFavoriteListUseCase>(() =>
        _i29.AddProductToFavoriteListUseCase(gh<_i22.ProductRepository>()));
    gh.lazySingleton<_i30.GetAllBrandsProductsUseCase>(
        () => _i30.GetAllBrandsProductsUseCase(gh<_i22.ProductRepository>()));
    gh.lazySingleton<_i31.GetBrandProductsUseCase>(
        () => _i31.GetBrandProductsUseCase(gh<_i22.ProductRepository>()));
    gh.lazySingleton<_i32.GetBrandsUseCase>(
        () => _i32.GetBrandsUseCase(gh<_i22.ProductRepository>()));
    gh.lazySingleton<_i33.GetCategoriesUseCase>(
        () => _i33.GetCategoriesUseCase(gh<_i22.ProductRepository>()));
    gh.lazySingleton<_i34.GetProductDetailsUseCase>(
        () => _i34.GetProductDetailsUseCase(gh<_i22.ProductRepository>()));
    gh.lazySingleton<_i35.GetProductsOffersUseCase>(
        () => _i35.GetProductsOffersUseCase(gh<_i22.ProductRepository>()));
    gh.lazySingleton<_i36.GetUserFavoriteListUseCase>(
        () => _i36.GetUserFavoriteListUseCase(gh<_i22.ProductRepository>()));
    gh.factory<_i37.HomeBloc>(() => _i37.HomeBloc(
          gh<_i33.GetCategoriesUseCase>(),
          gh<_i35.GetProductsOffersUseCase>(),
          gh<_i32.GetBrandsUseCase>(),
          gh<_i30.GetAllBrandsProductsUseCase>(),
        ));
    gh.factory<_i38.LoginCubit>(
        () => _i38.LoginCubit(gh<_i27.UserLoginUseCase>()));
    gh.factory<_i39.SignupCubit>(
        () => _i39.SignupCubit(gh<_i28.UserSignUpUseCase>()));
    gh.factory<_i40.DetailsCubit>(
        () => _i40.DetailsCubit(gh<_i34.GetProductDetailsUseCase>()));
    gh.factory<_i41.DiscoverCubit>(() => _i41.DiscoverCubit(
          gh<_i31.GetBrandProductsUseCase>(),
          gh<_i35.GetProductsOffersUseCase>(),
        ));
    gh.factory<_i42.FavoriteCubit>(() => _i42.FavoriteCubit(
          gh<_i19.GetAccessTokenUseCase>(),
          gh<_i36.GetUserFavoriteListUseCase>(),
          gh<_i29.AddProductToFavoriteListUseCase>(),
          gh<_i24.RemoveProductFromFavoriteListUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i43.RegisterModule {}

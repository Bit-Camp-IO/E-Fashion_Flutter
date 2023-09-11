// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:efashion_flutter/core/api/api_consumer.dart' as _i11;
import 'package:efashion_flutter/core/api/dio_consumer.dart' as _i12;
import 'package:efashion_flutter/core/api/dio_interceptor.dart' as _i5;
import 'package:efashion_flutter/core/api/dio_logger.dart' as _i6;
import 'package:efashion_flutter/core/router/app_router.dart' as _i3;
import 'package:efashion_flutter/features/auth/data/datasources/auth_data_source.dart'
    as _i13;
import 'package:efashion_flutter/features/auth/data/repositories/auth_repository_impl.dart'
    as _i15;
import 'package:efashion_flutter/features/auth/domain/repositories/auth_repository.dart'
    as _i14;
import 'package:efashion_flutter/features/auth/domain/usecases/user_login_usecase.dart'
    as _i22;
import 'package:efashion_flutter/features/auth/domain/usecases/user_signup_usecase.dart'
    as _i23;
import 'package:efashion_flutter/features/auth/presentation/cubits/login/login_cubit.dart'
    as _i27;
import 'package:efashion_flutter/features/auth/presentation/cubits/signup/signup_cubit.dart'
    as _i28;
import 'package:efashion_flutter/register_module.dart' as _i30;
import 'package:efashion_flutter/shared/data/datasources/theme_local_data_source.dart'
    as _i7;
import 'package:efashion_flutter/shared/data/datasources/tokens_local_data_source.dart'
    as _i10;
import 'package:efashion_flutter/shared/data/datasources/tokens_remote_data_source.dart'
    as _i19;
import 'package:efashion_flutter/shared/data/repositories/theme_repository_impl.dart'
    as _i9;
import 'package:efashion_flutter/shared/data/repositories/tokens_repository_impl.dart'
    as _i21;
import 'package:efashion_flutter/shared/domain/repositories/theme_repository.dart'
    as _i8;
import 'package:efashion_flutter/shared/domain/repositories/tokens_repository.dart'
    as _i20;
import 'package:efashion_flutter/shared/domain/usecases/theme/change_app_theme_usecase.dart'
    as _i16;
import 'package:efashion_flutter/shared/domain/usecases/theme/get_app_theme_usecase.dart'
    as _i17;
import 'package:efashion_flutter/shared/domain/usecases/tokens/check_if_tokens_exist_use_case.dart'
    as _i24;
import 'package:efashion_flutter/shared/domain/usecases/tokens/delete_tokens_use_case.dart'
    as _i25;
import 'package:efashion_flutter/shared/domain/usecases/tokens/get_access_token_usecase.dart'
    as _i26;
import 'package:efashion_flutter/shared/presentation/bloc/theme_cubit/theme_cubit.dart'
    as _i18;
import 'package:efashion_flutter/shared/presentation/bloc/tokens_cubit/tokens_cubit.dart'
    as _i29;
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
    gh.lazySingleton<_i4.Dio>(() => registerModule.dioClient);
    gh.lazySingleton<_i5.DioInterceptor>(() => _i5.DioInterceptor());
    gh.lazySingleton<_i6.DioLogInterceptor>(() => _i6.DioLogInterceptor());
    gh.lazySingleton<_i7.ThemeLocalDataSource>(
        () => _i7.ThemeLocalDataSourceImpl());
    gh.lazySingleton<_i8.ThemeRepository>(() => _i9.ThemeRepositoryImpl(
        localDataSource: gh<_i7.ThemeLocalDataSource>()));
    gh.lazySingleton<_i10.TokensLocalDataSource>(
        () => _i10.TokensLocalDataSourceImpl());
    gh.lazySingleton<_i11.ApiConsumer>(
        () => _i12.DioApiConsumer(dioClient: gh<_i4.Dio>()));
    gh.lazySingleton<_i13.AuthDataSource>(
        () => _i13.AuthDataSourceImpl(gh<_i11.ApiConsumer>()));
    gh.lazySingleton<_i14.AuthRepository>(() => _i15.AuthRepositoryImpl(
          gh<_i13.AuthDataSource>(),
          gh<_i10.TokensLocalDataSource>(),
        ));
    gh.lazySingleton<_i16.ChangeAppThemeUseCase>(() =>
        _i16.ChangeAppThemeUseCase(themeRepository: gh<_i8.ThemeRepository>()));
    gh.lazySingleton<_i17.GetAppThemeUseCase>(() =>
        _i17.GetAppThemeUseCase(themeRepository: gh<_i8.ThemeRepository>()));
    gh.factory<_i18.ThemeCubit>(() => _i18.ThemeCubit(
          gh<_i17.GetAppThemeUseCase>(),
          gh<_i16.ChangeAppThemeUseCase>(),
        ));
    gh.lazySingleton<_i19.TokensRemoteDataSource>(
        () => _i19.TokensRemoteDataSourceImpl(gh<_i11.ApiConsumer>()));
    gh.lazySingleton<_i20.TokensRepository>(() => _i21.TokensRepositoryImpl(
          gh<_i10.TokensLocalDataSource>(),
          gh<_i19.TokensRemoteDataSource>(),
        ));
    gh.lazySingleton<_i22.UserLoginUseCase>(
        () => _i22.UserLoginUseCase(authRepository: gh<_i14.AuthRepository>()));
    gh.lazySingleton<_i23.UserSignUpUseCase>(() =>
        _i23.UserSignUpUseCase(authRepository: gh<_i14.AuthRepository>()));
    gh.lazySingleton<_i24.CheckIfTokensExistUseCase>(
        () => _i24.CheckIfTokensExistUseCase(gh<_i20.TokensRepository>()));
    gh.lazySingleton<_i25.DeleteTokensUseCase>(
        () => _i25.DeleteTokensUseCase(gh<_i20.TokensRepository>()));
    gh.lazySingleton<_i26.GetAccessTokenUseCase>(
        () => _i26.GetAccessTokenUseCase(gh<_i20.TokensRepository>()));
    gh.factory<_i27.LoginCubit>(
        () => _i27.LoginCubit(gh<_i22.UserLoginUseCase>()));
    gh.factory<_i28.SignupCubit>(
        () => _i28.SignupCubit(gh<_i23.UserSignUpUseCase>()));
    gh.factory<_i29.TokensCubit>(() => _i29.TokensCubit(
          gh<_i24.CheckIfTokensExistUseCase>(),
          gh<_i25.DeleteTokensUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i30.RegisterModule {}

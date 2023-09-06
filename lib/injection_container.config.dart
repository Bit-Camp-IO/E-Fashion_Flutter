// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:efashion_flutter/core/api/api_consumer.dart' as _i11;
import 'package:efashion_flutter/core/api/dio_consumer.dart' as _i12;
import 'package:efashion_flutter/core/api/dio_interceptor.dart' as _i6;
import 'package:efashion_flutter/core/api/dio_logger.dart' as _i7;
import 'package:efashion_flutter/core/router/app_router.dart' as _i3;
import 'package:efashion_flutter/features/auth/presentation/cubit/auth_cubit.dart'
    as _i4;
import 'package:efashion_flutter/register_module.dart' as _i16;
import 'package:efashion_flutter/shared/data/datasources/local_data_source.dart'
    as _i8;
import 'package:efashion_flutter/shared/data/repositories/theme_repository_impl.dart'
    as _i10;
import 'package:efashion_flutter/shared/domain/repositories/theme_repository.dart'
    as _i9;
import 'package:efashion_flutter/shared/domain/usecases/change_app_theme_usecase.dart'
    as _i13;
import 'package:efashion_flutter/shared/domain/usecases/get_app_theme_usecase.dart'
    as _i14;
import 'package:efashion_flutter/shared/presentation/bloc/theme_cubit/theme_cubit.dart'
    as _i15;
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
    gh.factory<_i4.AuthCubit>(() => _i4.AuthCubit());
    gh.lazySingleton<_i5.Dio>(() => registerModule.dioClient);
    gh.lazySingleton<_i6.DioInterceptor>(() => _i6.DioInterceptor());
    gh.lazySingleton<_i7.DioLogInterceptor>(() => _i7.DioLogInterceptor());
    gh.lazySingleton<_i8.LocalDataSource>(() => _i8.LocalDataSourceImpl());
    gh.lazySingleton<_i9.ThemeRepository>(() =>
        _i10.ThemeRepositoryImpl(localDataSource: gh<_i8.LocalDataSource>()));
    gh.lazySingleton<_i11.ApiConsumer>(
        () => _i12.DioApiConsumer(dioClient: gh<_i5.Dio>()));
    gh.lazySingleton<_i13.ChangeAppThemeUseCase>(() =>
        _i13.ChangeAppThemeUseCase(themeRepository: gh<_i9.ThemeRepository>()));
    gh.lazySingleton<_i14.GetAppThemeUseCase>(() =>
        _i14.GetAppThemeUseCase(themeRepository: gh<_i9.ThemeRepository>()));
    gh.factory<_i15.ThemeCubit>(() => _i15.ThemeCubit(
          gh<_i14.GetAppThemeUseCase>(),
          gh<_i13.ChangeAppThemeUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i16.RegisterModule {}

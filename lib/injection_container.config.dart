// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:efashion_flutter/config/router/app_router.dart' as _i3;
import 'package:efashion_flutter/core/api/api_consumer.dart' as _i7;
import 'package:efashion_flutter/core/api/dio_consumer.dart' as _i8;
import 'package:efashion_flutter/core/api/dio_interceptor.dart' as _i5;
import 'package:efashion_flutter/core/api/dio_logger.dart' as _i6;
import 'package:efashion_flutter/register_module.dart' as _i9;
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
    gh.lazySingleton<_i7.ApiConsumer>(
        () => _i8.DioApiConsumer(dioClient: gh<_i4.Dio>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}

import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/app_routes_observer.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/shared/theme/theme_manager.dart';
import 'package:efashion_flutter/shared/util/size_manager.dart';
import 'package:efashion_flutter/presentation/shared/bloc/theme_cubit/theme_cubit.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/shared/bloc/tokens_cubit/tokens_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EfashionApp extends StatelessWidget {
  const EfashionApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeManager().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ThemeCubit>()..getAppTheme()),
        BlocProvider(create: (context) => getIt<TokensCubit>()..checkIfUserExist()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 800),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: getIt<AppRouter>().config(
                navigatorObservers: () => [AppRoutesObserver(), AutoRouteObserver()],
              ),
              theme: state.appTheme.isDarkTheme
                  ? ThemeManager.darkTheme()
                  : ThemeManager.lightTheme(),
            ),
          );
        },
      ),
    );
  }
}

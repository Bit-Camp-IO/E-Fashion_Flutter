import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/app_routes_observer.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/config/theme/theme_manager.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EfashionApp extends StatelessWidget {
  const EfashionApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: getIt<AppRouter>().config(
          navigatorObservers: () => [AppRoutesObserver(), AutoRouteObserver()],
        ),
        theme: ThemeManager.darkTheme(),
      ),
    );
  }
}

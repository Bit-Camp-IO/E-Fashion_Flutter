import 'package:efashion_flutter/shared/theme/color_scheme.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class ThemeManager {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: AssetsManager.primaryFontFamily,
      scaffoldBackgroundColor: const Color(0xFFF1F0F4),
      colorScheme: lightColorScheme,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFFF1F0F4),
          scrolledUnderElevation: 0,
          elevation: 0,
          titleSpacing: 10.w,
          titleTextStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.textColorPrimary,
          )),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 57.sp,
          fontFamily: AssetsManager.secondaryFontFamily,
        ),
        displayMedium: TextStyle(
          fontSize: 45.sp,
          fontFamily: AssetsManager.secondaryFontFamily,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          fontSize: 36.sp,
          fontFamily: AssetsManager.secondaryFontFamily,
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black.withOpacity(0.8),
        selectedItemColor: ColorsManager.lightPrimaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.6),

      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFF1A1C1E),
      fontFamily: AssetsManager.primaryFontFamily,
      colorScheme: darkColorScheme,
      appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF1A1C1E),
          scrolledUnderElevation: 0,
          elevation: 0,
          titleSpacing: 10.w,
          titleTextStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.textColorPrimary,
          )),
      useMaterial3: true,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 57.sp,
          fontFamily: AssetsManager.secondaryFontFamily,
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          fontSize: 45.sp,
          fontFamily: AssetsManager.secondaryFontFamily,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          fontSize: 36.sp,
          fontFamily: AssetsManager.secondaryFontFamily,
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black.withOpacity(0.8),
        selectedItemColor: ColorsManager.darkPrimaryColor,
        unselectedItemColor: Colors.white,
      ),
    );
  }

  static PaymentSheetAppearance stripeSheetTheme({required BuildContext context}){
    return PaymentSheetAppearance(
      colors: PaymentSheetAppearanceColors(
        primary: Theme.of(context).colorScheme.primary,
        primaryText: Theme.of(context).colorScheme.primary,
        secondaryText: Theme.of(context).colorScheme.outline,
        background: Theme.of(context).scaffoldBackgroundColor,
        componentBackground: Theme.of(context).colorScheme.onInverseSurface,
        componentText: Theme.of(context).colorScheme.onSurfaceVariant,
        placeholderText: Theme.of(context).colorScheme.outline,
        error: Theme.of(context).colorScheme.error,
        icon: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

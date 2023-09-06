part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final AppTheme appTheme;

  const ThemeState({
    this.appTheme = const AppTheme(
      isDarkTheme: false,
    ),
  });

  ThemeState copyWith({
    AppTheme? appTheme,
}){
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  @override
  List<Object?> get props => [appTheme];
}

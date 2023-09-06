import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'theme_state.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(false));
  void toggleTheme(bool isDarkMode) {
    emit(ThemeState(isDarkMode));
  }
}
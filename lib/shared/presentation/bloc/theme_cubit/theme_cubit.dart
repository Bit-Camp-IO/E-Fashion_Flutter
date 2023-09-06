import 'package:efashion_flutter/shared/domain/entities/app_theme.dart';
import 'package:efashion_flutter/shared/domain/usecases/change_app_theme_usecase.dart';
import 'package:efashion_flutter/shared/domain/usecases/get_app_theme_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'theme_state.dart';

@injectable
class ThemeCubit extends Cubit<ThemeState> {
  final GetAppThemeUseCase _getAppThemeUseCase;
  final ChangeAppThemeUseCase _changeAppThemeUseCase;

  ThemeCubit(this._getAppThemeUseCase, this._changeAppThemeUseCase) : super(const ThemeState());
  Future<void> changeAppTheme(bool isDarkTheme) async{
  final appTheme =  await _changeAppThemeUseCase(isDarkTheme: isDarkTheme);
    emit(state.copyWith(appTheme: appTheme));
  }

  void getAppTheme(){
    final appTheme =  _getAppThemeUseCase();
    emit(state.copyWith(appTheme: appTheme));
  }
}
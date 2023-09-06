import 'package:equatable/equatable.dart';

class AppTheme extends Equatable{
  final bool isDarkTheme;

  const AppTheme({required this.isDarkTheme});
  @override
  List<Object?> get props => [isDarkTheme];
}
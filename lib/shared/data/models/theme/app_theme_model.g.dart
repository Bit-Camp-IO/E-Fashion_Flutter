// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppThemeModelAdapter extends TypeAdapter<AppThemeModel> {
  @override
  final int typeId = 1;

  @override
  AppThemeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppThemeModel(
      isDarkTheme: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AppThemeModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isDarkTheme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppThemeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

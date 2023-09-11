// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokensModelAdapter extends TypeAdapter<TokensModel> {
  @override
  final int typeId = 2;

  @override
  TokensModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokensModel(
      accessToken: fields[0] as String,
      refreshToken: fields[1] as String,
      accessTokenTimeStamp: fields[2] as DateTime,
      refreshTokenTimeStamp: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TokensModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.refreshToken)
      ..writeByte(2)
      ..write(obj.accessTokenTimeStamp)
      ..writeByte(3)
      ..write(obj.refreshTokenTimeStamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokensModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

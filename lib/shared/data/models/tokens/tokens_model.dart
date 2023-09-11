
import 'package:efashion_flutter/shared/domain/entities/tokens.dart';
import 'package:hive/hive.dart';

part 'tokens_model.g.dart';
@HiveType(typeId: 2)
class TokensModel extends HiveObject{

  @HiveField(0)
  final String accessToken;
  @HiveField(1)
  final String refreshToken;
  @HiveField(2)
  final DateTime accessTokenTimeStamp;
  @HiveField(3)
  final DateTime refreshTokenTimeStamp;
  TokensModel( {
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenTimeStamp,
    required this.refreshTokenTimeStamp,
  });

  factory TokensModel.fromJson(Map<String, dynamic> jsonData) {
    return TokensModel(
      accessToken: jsonData['data']['accessToken'],
      refreshToken: jsonData['data']['refreshToken'],
      accessTokenTimeStamp: DateTime.now(),
      refreshTokenTimeStamp: DateTime.now(),
    );
  }

  toAuthTokens() {
    return Tokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      timeStamp: accessTokenTimeStamp,
    );
  }

  TokensModel copyWith({
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenTimeStamp,
    DateTime? refreshTokenTimeStamp,
  }) {
    return TokensModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      accessTokenTimeStamp: accessTokenTimeStamp ?? this.accessTokenTimeStamp,
      refreshTokenTimeStamp: refreshTokenTimeStamp ?? this.refreshTokenTimeStamp,
    );
  }
}

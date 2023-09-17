import 'package:equatable/equatable.dart';

class Tokens extends Equatable{
  final String accessToken;
  final String refreshToken;
  final DateTime timeStamp;

  const Tokens({required this.accessToken, required this.refreshToken, required this.timeStamp});
  @override
  List<Object?> get props => [accessToken, refreshToken, timeStamp];
}
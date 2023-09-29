import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class FetchDataException extends ServerException {
  const FetchDataException([message]) : super(message ?? "There was an error, try again later.");
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super(message ?? "Bad Request");
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message]) : super(message ?? "Unauthorized");
}

class NotFoundException extends ServerException {
  const NotFoundException([message]) : super(message ?? "Requested Info Not Found");
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super(message ?? "Conflict Occurred");
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([message])
      : super(message ?? "Internal Server Error");
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([message])
      : super(message ?? "Please Check Your Internet Connection");
}

class LaunchUrlException extends ServerException {
  const LaunchUrlException([message])
      : super(message ?? "No Internet Connection");
}

class CacheException extends Equatable implements Exception {
  final String? message;

  const CacheException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }

}

class TokensException extends Equatable implements Exception {
  final String? message;

  const TokensException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }

}
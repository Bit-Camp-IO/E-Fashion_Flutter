import 'package:equatable/equatable.dart';

class PlaceData extends Equatable{
  final double latitude;
  final double longitude;

  const PlaceData({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}
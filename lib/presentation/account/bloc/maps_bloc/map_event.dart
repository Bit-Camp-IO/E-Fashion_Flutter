part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

class GetUserLocationEvent extends MapEvent{
  const GetUserLocationEvent();
  @override
  List<Object?> get props => [];
}
class UpdateUserLocationEvent extends MapEvent{

  const UpdateUserLocationEvent();

  @override
  List<Object?> get props => [];
}
class GetPlacesSuggestionsEvent extends MapEvent{
  final String searchQuery;

  const GetPlacesSuggestionsEvent({required this.searchQuery});
  @override
  List<Object?> get props => [searchQuery];
}

class GetPlaceLatitudeAndLongitudeEvent extends MapEvent{
  final String placeId;

  const GetPlaceLatitudeAndLongitudeEvent({required this.placeId});
  @override
  List<Object?> get props => [placeId];
}

class AddPlaceMarkerEvent extends MapEvent{
  final double latitude;
  final double longitude;

  const AddPlaceMarkerEvent({required this.latitude, required this.longitude});
  @override
  List<Object?> get props => [latitude, longitude];
}
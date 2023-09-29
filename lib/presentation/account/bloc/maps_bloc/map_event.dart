part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
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
  final Marker marker;

  const AddPlaceMarkerEvent({required this.marker});
  @override
  List<Object?> get props => [marker];
}
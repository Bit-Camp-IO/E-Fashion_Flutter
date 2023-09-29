part of 'map_bloc.dart';

class MapState extends Equatable {
  final List<Place> places;
  final BlocState placesState;
  final String placesRetriveFailMessage;
  final PlaceData placeData;
  final BlocState placeDetailsState;
  final Set<Marker> markers;
  final BlocState setMarkerState;

  const MapState({
    this.places = const [],
    this.placesState = BlocState.initial,
    this.placesRetriveFailMessage = '',
    this.placeData = const PlaceData(
      latitude: 0,
      longitude: 0,
    ),
    this.placeDetailsState = BlocState.initial,
    this.markers = const <Marker>{},
    this.setMarkerState = BlocState.initial,
  });

  @override
  List<Object> get props => [
        places,
        placesState,
        placesRetriveFailMessage,
        placeData,
        placeDetailsState,
        markers,
        setMarkerState,
      ];

  MapState copyWith(
      {List<Place>? places,
      BlocState? placesState,
      String? placesRetriveFailMessage,
      PlaceData? placeData,
      BlocState? placeDetailsState,
      Set<Marker>? markers,
      BlocState? setMarkerState}) {
    return MapState(
      places: places ?? this.places,
      placesState: placesState ?? this.placesState,
      placesRetriveFailMessage:
          placesRetriveFailMessage ?? this.placesRetriveFailMessage,
      placeData: placeData ?? this.placeData,
      placeDetailsState: placeDetailsState ?? this.placeDetailsState,
      markers: markers ?? this.markers,
      setMarkerState: setMarkerState ?? this.setMarkerState,
    );
  }
}

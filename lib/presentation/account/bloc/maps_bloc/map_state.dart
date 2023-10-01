part of 'map_bloc.dart';

class MapState extends Equatable {
  final List<Place> places;
  final BlocState placesState;
  final String placesRetriveFailMessage;
  final PlaceData placeData;
  final BlocState placeDataState;
  final Set<Marker> markers;
  final BlocState setMarkerState;
  final PlaceData userLocation;
  final BlocState userLocationState;
  final String locationUpdateMessage;
  final BlocState locationUpdateState;

  const MapState({
    this.places = const [],
    this.placesState = BlocState.initial,
    this.placesRetriveFailMessage = '',
    this.placeData = const PlaceData(
      latitude: 0,
      longitude: 0,
    ),
    this.placeDataState = BlocState.initial,
    this.markers = const <Marker>{},
    this.setMarkerState = BlocState.initial,
    this.userLocation = const PlaceData(
      latitude: 0,
      longitude: 0,
    ),
    this.userLocationState = BlocState.initial,
    this.locationUpdateMessage = '',
    this.locationUpdateState = BlocState.initial,
  });

  @override
  List<Object> get props => [
        places,
        placesState,
        placesRetriveFailMessage,
        placeData,
        placeDataState,
        markers,
        setMarkerState,
        userLocation,
        userLocationState,
        locationUpdateState,
        locationUpdateMessage
      ];

  MapState copyWith({
    List<Place>? places,
    BlocState? placesState,
    String? placesRetriveFailMessage,
    PlaceData? placeData,
    BlocState? placeDataState,
    Set<Marker>? markers,
    BlocState? setMarkerState,
    PlaceData? userLocation,
    BlocState? userLocationState,
    String? locationUpdateMessage,
    BlocState? locationUpdateState,
  }) {
    return MapState(
      places: places ?? this.places,
      placesState: placesState ?? this.placesState,
      placesRetriveFailMessage:
          placesRetriveFailMessage ?? this.placesRetriveFailMessage,
      placeData: placeData ?? this.placeData,
      placeDataState: placeDataState ?? this.placeDataState,
      markers: markers ?? this.markers,
      setMarkerState: setMarkerState ?? this.setMarkerState,
      userLocation: userLocation ?? this.userLocation,
      userLocationState: userLocationState ?? this.userLocationState,
      locationUpdateMessage:
          locationUpdateMessage ?? this.locationUpdateMessage,
      locationUpdateState: locationUpdateState ?? this.locationUpdateState,
    );
  }
}

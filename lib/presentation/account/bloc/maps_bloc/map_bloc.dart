import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart';
import 'package:efashion_flutter/components/mapComponent/domain/entities/place.dart';
import 'package:efashion_flutter/components/mapComponent/domain/entities/place_data.dart';
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_place_latitude_and_longitude_usecase.dart';
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_places_suggestions_usecase.dart';
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_user_location_usecase.dart';
import 'package:efashion_flutter/components/mapComponent/domain/usecases/update_user_location_usecase.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'map_event.dart';

part 'map_state.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  final GetPlacesSuggestionsUseCase _getPlacesSuggestionsUseCase;
  final GetPlaceLatitudeAndLongitudeUseCase
      _getPlaceLatitudeAndLongitudeUseCase;
  final GetUserLocationUseCase _getUserLocationUseCase;
  final UpdateUserLocationUseCase _updateUserLocationUseCase;
  final GetUserAccessTokenUseCase _getAccessTokenUseCase;
  late String userAccessToken;

  MapBloc(
    this._getPlacesSuggestionsUseCase,
    this._getPlaceLatitudeAndLongitudeUseCase,
    this._getUserLocationUseCase,
    this._updateUserLocationUseCase,
    this._getAccessTokenUseCase,
  ) : super(const MapState()) {
    on<GetUserLocationEvent>(_getUserLocationEvent);
    on<UpdateUserLocationEvent>(_updateUserLocationEvent);
    on<GetPlacesSuggestionsEvent>(
      _getPlacesSuggestionsEvent,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 700))
          .distinct()
          .switchMap(mapper),
    );
    on<GetPlaceLatitudeAndLongitudeEvent>(_getPlaceLatitudeAndLongitudeEvent);
    on<AddPlaceMarkerEvent>(_addPlaceMarkerEvent);
  }

  Future<void> _getUserLocationEvent(
      GetUserLocationEvent event, Emitter<MapState> emit) async {
    emit(state.copyWith(userLocationState: BlocState.loading));
    final getUserAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getUserAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty) {
      final response =
          await _getUserLocationUseCase(userAccessToken: userAccessToken);
      response.fold(
        (failure) => emit(
          state.copyWith(userLocationState: BlocState.failure),
        ),
        (userLocation) => emit(
          state.copyWith(
            userLocation: userLocation,
            markers: _buildMarker(
              latitude: userLocation.latitude,
              longitude: userLocation.longitude,
            ),
            userLocationState: BlocState.success,
          ),
        ),
      );
    }
  }

  Future<void> _updateUserLocationEvent(
      UpdateUserLocationEvent event, Emitter<MapState> emit) async {
    emit(state.copyWith(locationUpdateState: BlocState.loading));
    final getUserAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getUserAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty && state.markers.isNotEmpty) {
      final response = await _updateUserLocationUseCase(
        userAccessToken: userAccessToken,
        latitude: state.markers.first.position.latitude,
        longitude: state.markers.first.position.longitude,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            locationUpdateState: BlocState.failure,
            locationUpdateMessage: failure.message,
          ),
        ),
        (updateMessage) => emit(
          state.copyWith(
            locationUpdateState: BlocState.success,
            locationUpdateMessage: updateMessage,
          ),
        ),
      );
    } else if (state.markers.isEmpty) {
      emit(
        state.copyWith(
          locationUpdateState: BlocState.failure,
          locationUpdateMessage: "ERROR! You should set a marker first.",
        ),
      );
    }
  }

  Future<void> _getPlacesSuggestionsEvent(
      GetPlacesSuggestionsEvent event, Emitter<MapState> emit) async {
    if (event.searchQuery.isNotEmpty) {
      emit(state.copyWith(places: [], setMarkerState: BlocState.loading));
      final response =
          await _getPlacesSuggestionsUseCase(searchQuery: event.searchQuery);
      response.fold(
        (failure) => emit(
          state.copyWith(
            placesState: BlocState.failure,
            placesRetriveFailMessage: failure.message,
          ),
        ),
        (places) => emit(
          state.copyWith(
            places: places,
          ),
        ),
      );
    }
  }

  Future<void> _getPlaceLatitudeAndLongitudeEvent(
      GetPlaceLatitudeAndLongitudeEvent event, Emitter<MapState> emit) async {
    emit(state.copyWith(
      placeDataState: BlocState.loading,
      setMarkerState: BlocState.loading,
      userLocationState: BlocState.initial,
    ));
    final response =
        await _getPlaceLatitudeAndLongitudeUseCase(placeId: event.placeId);
    response.fold(
      (failure) => emit(
        state.copyWith(
          placeDataState: BlocState.failure,
          placesRetriveFailMessage: failure.message,
        ),
      ),
      (placeData) {
        emit(
          state.copyWith(
            placeData: placeData,
            placeDataState: BlocState.success,
            markers: _buildMarker(
              latitude: placeData.latitude,
              longitude: placeData.longitude,
            ),
            setMarkerState: BlocState.success,
          ),
        );
      },
    );
  }

  void _addPlaceMarkerEvent(AddPlaceMarkerEvent event, Emitter<MapState> emit) async {
    emit(
      state.copyWith(
        userLocationState: BlocState.initial,
        placeDataState: BlocState.initial,
        locationUpdateState: BlocState.initial,
        markers: _buildMarker(latitude: event.latitude, longitude: event.longitude),
        setMarkerState: BlocState.success,
      ),
    );
  }

  Set<Marker> _buildMarker({required double latitude, required double longitude}) {
    return <Marker>{
          Marker(
            markerId: const MarkerId(AppConstants.userLocationMarkerId),
            position: LatLng(
              latitude,
              longitude,
            ),
          ),
    };
  }
}

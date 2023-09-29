import 'package:efashion_flutter/components/mapComponent/domain/entities/place.dart';
import 'package:efashion_flutter/components/mapComponent/domain/entities/place_data.dart';
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_place_latitude_and_longitude_usecase.dart';
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_places_suggestions_usecase.dart';
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

  MapBloc(
    this._getPlacesSuggestionsUseCase,
    this._getPlaceLatitudeAndLongitudeUseCase,
  ) : super(const MapState()) {
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

  Future<void> _getPlacesSuggestionsEvent(
      GetPlacesSuggestionsEvent event, Emitter<MapState> emit) async {
    if (event.searchQuery.isNotEmpty) {
      emit(state.copyWith(placesState: BlocState.loading, places: []));
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
            placesState: BlocState.success,
          ),
        ),
      );
    }
  }

  Future<void> _getPlaceLatitudeAndLongitudeEvent(
      GetPlaceLatitudeAndLongitudeEvent event, Emitter<MapState> emit) async {
    emit(state.copyWith(placeDetailsState: BlocState.loading, setMarkerState: BlocState.loading));
    final response =
        await _getPlaceLatitudeAndLongitudeUseCase(placeId: event.placeId);
    response.fold(
      (failure) => emit(
        state.copyWith(
          placeDetailsState: BlocState.failure,
          placesRetriveFailMessage: failure.message,
        ),
      ),
      (placeData) {
        final Set<Marker> newMarker = {
          Marker(
            markerId: const MarkerId(AppConstants.userLocationMarkerId),
            position: LatLng(
              placeData.latitude,
              placeData.longitude,
            ),
          ),
        };
        emit(
          state.copyWith(
            placeData: placeData,
            placeDetailsState: BlocState.success,
            markers: newMarker,
            setMarkerState: BlocState.success
          ),
        );
      },
    );
  }

  void _addPlaceMarkerEvent(
      AddPlaceMarkerEvent event, Emitter<MapState> emit) async {
    emit(state.copyWith(setMarkerState: BlocState.loading));
    final Set<Marker> newMarker = {event.marker};
    emit(
      state.copyWith(
        markers: newMarker,
        setMarkerState: BlocState.success,
      ),
    );
  }
}

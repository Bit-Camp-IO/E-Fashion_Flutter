import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/account/bloc/maps_bloc/map_bloc.dart';
import 'package:efashion_flutter/presentation/account/components/map/map_search_field.dart';
import 'package:efashion_flutter/presentation/shared/bloc/theme_cubit/theme_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_snack_bar.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class LocationScreen extends StatefulWidget implements AutoRouteWrapper {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MapBloc>(),
      child: this,
    );
  }
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController _mapController;
  late final String _darkMapStyle;

  CameraPosition _setInitialPosition() {
    return const CameraPosition(
      target: LatLng(31.205753, 29.924526),
      zoom: 13.151926040649414,
    );
  }

  Future _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString(AssetsManager.mapDarkModeJson);
  }

  @override
  void initState() {
    _loadMapStyles();
    super.initState();
  }

  Future<void> _moveCamera({
    required double latitude,
    required double longitude,
  }) async {
    final CameraPosition newPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      tilt: 59.440717697143555,
      zoom: 20,
    );
    await _mapController.animateCamera(
      CameraUpdate.newCameraPosition(newPosition),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<MapBloc, MapState>(
        listener: (context, state) async {
          if (state.locationUpdateState == BlocState.failure || state.locationUpdateState == BlocState.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.show(
                customSnackBarType:
                state.locationUpdateState == BlocState.failure
                    ? CustomSnackBarType.error
                    : CustomSnackBarType.success,
                message: state.locationUpdateMessage,
                context: context,
              ),
            );
            context.popRoute();
          } else if (state.placeDataState == BlocState.success &&
              state.setMarkerState == BlocState.success) {
            await _moveCamera(
              latitude: state.placeData.latitude,
              longitude: state.placeData.longitude,
            );
          }else if (state.userLocationState == BlocState.success) {
            Future.delayed(const Duration(milliseconds: 300));
            await _moveCamera(
              latitude: state.userLocation.latitude,
              longitude: state.userLocation.longitude,
            );
          } else if (state.setMarkerState == BlocState.success) {
            await _moveCamera(
              latitude: state.markers.first.position.latitude,
              longitude: state.markers.first.position.longitude,
            );
          }
        },
        child: Stack(
          children: [
            BlocBuilder<MapBloc, MapState>(
              builder: (context, state) {
                return GoogleMap(
                  mapType: MapType.normal,
                  markers: state.markers,
                  compassEnabled: false,
                  zoomControlsEnabled: false,
                  onTap: (argument) async {
                    context.read<MapBloc>().add(
                      AddPlaceMarkerEvent(
                        latitude: argument.latitude,
                        longitude: argument.longitude,
                      ),
                    );
                  },
                  initialCameraPosition: _setInitialPosition(),
                  onMapCreated: (GoogleMapController controller) async {
                    _mapController = controller;
                    if (context.read<ThemeCubit>().state.appTheme.isDarkTheme) {
                      _mapController.setMapStyle(_darkMapStyle);
                    }
                    context.read<MapBloc>().add(const GetUserLocationEvent());
                  },
                );
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 50.h,
              child: BlocBuilder<MapBloc, MapState>(
                builder: (context, state) {
                  return MapSearchField(
                    onChanged: (value) {
                      context
                          .read<MapBloc>()
                          .add(GetPlacesSuggestionsEvent(searchQuery: value));
                    },
                    onPlaceChoose: (placeId) {
                      context.read<MapBloc>().add(
                          GetPlaceLatitudeAndLongitudeEvent(placeId: placeId));
                    },
                    places: state.places,
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 60.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
                child: PrimaryButton(
                  buttonTitle: 'Confirm Location',
                  onTap: () {
                    context
                        .read<MapBloc>()
                        .add(const UpdateUserLocationEvent());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}

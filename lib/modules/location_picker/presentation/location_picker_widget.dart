import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:resturant_management/generated/l10n.dart';
import 'package:resturant_management/modules/location_picker/bloc/location_picker_bloc.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/font_consts.dart';

class LocationPickerWidget extends StatefulWidget {
  const LocationPickerWidget({super.key});

  @override
  State<LocationPickerWidget> createState() => _LocationPickerWidgetState();
}

class _LocationPickerWidgetState extends State<LocationPickerWidget> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  final LatLng _initialPosition = const LatLng(13.1986, 77.7066);
  LatLng? _pinnedLocation;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationPickerBloc, LocationPickerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMapWidget(),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flexible(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(_pinnedLocation);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      textAlign: TextAlign.center,
                      Strings.of(context).confirmLocation,
                      style: const TextStyle(
                        color: AppColors.surface,
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.large,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMapWidget() {
    return Expanded(
      child: GoogleMap(
        onMapCreated: (controller) async {
          _mapController.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 11,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("location picker"),
            draggable: true,
            onDrag: (LatLng value) {
              _pinnedLocation = value;
            },
            position: _initialPosition,
          ),
        },
      ),
    );
  }
}

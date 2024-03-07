import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_app/core/location_provider/location_state.dart';

class LocationNotifier extends StateNotifier<LocationState> {
  LocationNotifier() : super(const LocationState()) {
    _subscription =
        _geolocatorPlatform.getServiceStatusStream().listen(_listener);
  }

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _listener(ServiceStatus status) {
    state = state.copyWith(serviceEnabled: status == ServiceStatus.enabled);
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      state = state.copyWith(
        serviceEnabled: false,
      );

      return false;
    }

    state = state.copyWith(
      serviceEnabled: true,
    );

    permission = await _geolocatorPlatform.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();

      if (permission == LocationPermission.denied) {
        state = state.copyWith(
          permission: permission,
        );
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      state = state.copyWith(
        permission: permission,
      );

      return false;
    }

    state = state.copyWith(
      permission: permission,
    );

    return true;
  }
}

final locationProvider =
    StateNotifierProvider.autoDispose<LocationNotifier, LocationState>((ref) {
  return LocationNotifier();
});

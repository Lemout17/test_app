import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'location_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class LocationState with _$LocationState {
  const factory LocationState({
    @Default(false) bool serviceEnabled,
    @Default(LocationPermission.denied) LocationPermission permission,
  }) = _LocationState;
}

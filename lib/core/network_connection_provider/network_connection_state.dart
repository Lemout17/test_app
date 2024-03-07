import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_connection_state.freezed.dart';

@freezed
class NetworkConnectionState with _$NetworkConnectionState {
  factory NetworkConnectionState({
    @Default(true) bool hasConnection,
  }) = _NetworkConnectionState;
}

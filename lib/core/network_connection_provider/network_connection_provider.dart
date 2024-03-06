import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_app/core/network_connection_provider/network_connection_state.dart';

class NetworkConnectionNotifier extends StateNotifier<NetworkConnectionState> {
  NetworkConnectionNotifier()
      : super(NetworkConnectionState(
          networkStream: InternetConnectionChecker().onStatusChange,
        )) {
    listenConnection();
  }

  void listenConnection() {
    InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            state = state.copyWith(
              hasConnection: true,
            );
            break;
          case InternetConnectionStatus.disconnected:
            state = state.copyWith(hasConnection: false);
            break;
        }
      },
    );
  }
}

final networkConnectionProvider =
    StateNotifierProvider<NetworkConnectionNotifier, NetworkConnectionState>(
  (ref) => NetworkConnectionNotifier(),
);

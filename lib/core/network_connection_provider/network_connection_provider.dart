import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_app/core/network_connection_provider/network_connection_state.dart';

class NetworkConnectionNotifier extends StateNotifier<NetworkConnectionState> {
  NetworkConnectionNotifier() : super(NetworkConnectionState()) {
    _subscription =
        InternetConnectionChecker().onStatusChange.listen(_listener);
  }

  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _listener(InternetConnectionStatus status) {
    state = state.copyWith(
      hasConnection: status == InternetConnectionStatus.connected,
    );
  }
}

final networkConnectionProvider = StateNotifierProvider.autoDispose<
    NetworkConnectionNotifier, NetworkConnectionState>(
  (ref) => NetworkConnectionNotifier(),
);

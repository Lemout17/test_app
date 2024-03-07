import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/core/location_provider/location_provider.dart';
import 'package:test_app/presentation/screens/login_screen/provider/login_screen_state.dart';

class LoginScreenNotifier extends StateNotifier<LoginScreenState> {
  LoginScreenNotifier({required this.locationProvider})
      : super(const LoginScreenState());

  final LocationNotifier locationProvider;

  void changeUsername(String username) {
    state = state.copyWith(
      username: username,
    );
  }

  void sendUsername() async {
    state = state.copyWith(
      isLoading: true,
    );

    await locationProvider.getCurrentPosition();

    state = state.copyWith(
      isLoading: false,
    );
  }
}

final loginScreenProvider =
    StateNotifierProvider.autoDispose<LoginScreenNotifier, LoginScreenState>(
  (ref) => LoginScreenNotifier(
    locationProvider: ref.watch(locationProvider.notifier),
  ),
);

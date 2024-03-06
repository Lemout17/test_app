import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/presentation/screens/login_screen/provider/login_screen_state.dart';

class LoginScreenNotifier extends StateNotifier<LoginScreenState> {
  LoginScreenNotifier() : super(const LoginScreenState());

  void changeUsername(String username) {
    state = state.copyWith(
      username: username,
    );
  }

  void sendUsername() async {
    state = state.copyWith(
      isLoading: true,
    );

    await Future.delayed(const Duration(seconds: 1));

    state = state.copyWith(
      isLoading: false,
    );
  }
}

final loginScreenProvider =
    StateNotifierProvider.autoDispose<LoginScreenNotifier, LoginScreenState>(
  (ref) => LoginScreenNotifier(),
);

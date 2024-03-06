import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_screen_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState({
    @Default('') String username,
    @Default(false) bool isLoading,
  }) = _LoginScreenState;
}

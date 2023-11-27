part of 'google_auth_cubit.dart';

@freezed
class GoogleAuthState with _$GoogleAuthState {
  const factory GoogleAuthState.initial({AuthClient? client}) = _Initial;

  const factory GoogleAuthState.loading({AuthClient? client}) = _Loading;

  const factory GoogleAuthState({
    required GoogleSignInAccount? account,
    required AuthClient? client,
    required Map<String, String>? headers,
    required SheetsApi? sheetsApi,
  }) = _GoogleAuthState;
}

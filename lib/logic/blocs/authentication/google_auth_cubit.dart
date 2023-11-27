import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

part 'google_auth_state.dart';

part 'google_auth_cubit.freezed.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[DriveApi.driveScope, SheetsApi.spreadsheetsScope],
  );

  StreamSubscription? _googleUserListener;

  GoogleAuthCubit() : super(const GoogleAuthState.initial()) {
    _googleUserListener = _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (account == null) {
        signIn();
      }
    });
    signInSilently();
  }

  Future<void> signIn() async {
    emit(const GoogleAuthState.loading());
    GoogleSignInAccount? account = await _googleSignIn.signIn();
    AuthClient? client = await _googleSignIn.authenticatedClient();
    final SheetsApi? sheetsApi = client != null ? SheetsApi(client) : null;
    final Map<String, String>? headers = await account?.authHeaders;
    return emit(GoogleAuthState(account: account, client: client, headers: headers, sheetsApi: sheetsApi));
  }

  Future<void> signInSilently() async {
    emit(const GoogleAuthState.loading());
    GoogleSignInAccount? account = await _googleSignIn.signInSilently();
    if (account == null) {
      return await signIn();
    }
    AuthClient? client = await _googleSignIn.authenticatedClient();
    final SheetsApi? sheetsApi = client != null ? SheetsApi(client) : null;
    final Map<String, String>? headers = await account?.authHeaders;
    return emit(GoogleAuthState(account: account, client: client, headers: headers, sheetsApi: sheetsApi));
  }

  Future<void> signOut() async {
    GoogleSignInAccount? account = await _googleSignIn.signOut();
    AuthClient? client = await _googleSignIn.authenticatedClient();
    final Map<String, String>? headers = await account?.authHeaders;
    return emit(GoogleAuthState(account: account, client: client, headers: headers, sheetsApi: null));
  }

  @override
  Future<void> close() {
    _googleUserListener?.cancel();
    return super.close();
  }
}

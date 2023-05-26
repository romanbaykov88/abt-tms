import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:googleapis/sheets/v4.dart';

part 'google_auth_state.dart';

part 'google_auth_cubit.freezed.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[DriveApi.driveScope, SheetsApi.spreadsheetsScope],
  );

  GoogleAuthCubit() : super(const GoogleAuthState.initial()) {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (account == null) {
        signIn();
      }
    });
    signInSilently();
  }

  Future<void> signIn() async {
    emit(const GoogleAuthState.loading());
    GoogleSignInAccount? account = await _googleSignIn.signIn();
    return emit(GoogleAuthState(account: account));
  }

  Future<void> signInSilently() async {
    emit(const GoogleAuthState.loading());
    GoogleSignInAccount? account = await _googleSignIn.signInSilently();
    if (account == null) {
      return await signIn();
    }
    return emit(GoogleAuthState(account: account));
  }

  Future<void> signOut() async {
    GoogleSignInAccount? account = await _googleSignIn.signOut();
    return emit(GoogleAuthState(account: account));
  }
}

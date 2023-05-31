import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';

part 'sheets_list_state.dart';

part 'sheets_list_cubit.freezed.dart';

class SheetsListCubit extends Cubit<SheetsListState> {
  GoogleAuthCubit? _googleAuthCubit;
  StreamSubscription? _googleSignInListener;

  SheetsListCubit(GoogleAuthCubit? googleAuthCubit)
      : super(const SheetsListState.initial()) {
    _googleAuthCubit = googleAuthCubit;
    _googleSignInListener =
        _googleAuthCubit?.stream.listen((GoogleAuthState event) {
      event.when((account, client) {
        getSheetsList();
      }, initial: (client) {}, loading: (client) {});
    });
    getSheetsList();
  }

  Future<void> getSheetsList() async {
    final client = _googleAuthCubit?.state.client;
    if (client != null) {
      emit(const SheetsListState.loading());
      final DriveApi driveApi = DriveApi(client);
      final FileList fileList = await driveApi.files.list(
          q: 'mimeType = \'application/vnd.google-apps.spreadsheet\'',
          pageSize: 100);
      emit(SheetsListState(fileList: fileList));
    } else {
      emit(const SheetsListState.error());
    }
  }

  @override
  Future<void> close() {
    _googleSignInListener?.cancel();
    return super.close();
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';

part 'documents_list_state.dart';

part 'documents_list_cubit.freezed.dart';

class DocumentsListCubit extends Cubit<DocumentsListState> {
  GoogleAuthCubit? _googleAuthCubit;
  StreamSubscription? _googleSignInListener;

  DocumentsListCubit(GoogleAuthCubit? googleAuthCubit)
      : super(const DocumentsListState.initial()) {
    _googleAuthCubit = googleAuthCubit;
    _googleSignInListener =
        _googleAuthCubit?.stream.listen((GoogleAuthState event) {
      event.when((account, client, headers, sheetsApi) {
        getDocumentsList();
      }, initial: (client) {}, loading: (client) {});
    });
    getDocumentsList();
  }

  Future<void> getDocumentsList() async {
    final client = _googleAuthCubit?.state.client;
    if (client != null) {
      emit(const DocumentsListState.loading());
      final DriveApi driveApi = DriveApi(client);
      final FileList fileList = await driveApi.files.list(
          q: 'mimeType = \'application/vnd.google-apps.spreadsheet\'',
          $fields: "files(id, name, mimeType, thumbnailLink)",
          pageSize: 100);
      emit(DocumentsListState(fileList: fileList));
    } else {
      emit(const DocumentsListState.error());
    }
  }

  @override
  Future<void> close() {
    _googleSignInListener?.cancel();
    return super.close();
  }
}

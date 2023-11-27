import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';

part 'document_file_state.dart';

part 'document_file_cubit.freezed.dart';

class DocumentFileCubit extends Cubit<DocumentFileState> {
  GoogleAuthCubit? _googleAuthCubit;

  DocumentFileCubit(GoogleAuthCubit? googleAuthCubit)
      : super(const DocumentFileState.initial()) {
    _googleAuthCubit = googleAuthCubit;
  }

  openFile(File file) async {
    emit(const DocumentFileState.loading());
    final SheetsApi? sheetsApi = _googleAuthCubit?.state.when(
        (account, client, headers, sheetsApi) => sheetsApi,
        initial: (sheetsApi) => null,
        loading: (sheetsApi) => null);
    if (sheetsApi != null) {
      final Spreadsheet document = await sheetsApi.spreadsheets.get(
        file.id!,
        //includeGridData: true,
        //ranges: ["JANUARY 2023"]
      );
      emit(DocumentFileState(document: document));
    }
  }
}
//JANUARY 2023

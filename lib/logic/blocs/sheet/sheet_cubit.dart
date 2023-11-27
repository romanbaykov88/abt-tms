import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';

part 'sheet_state.dart';

part 'sheet_cubit.freezed.dart';

class SheetCubit extends Cubit<SheetState> {
  GoogleAuthCubit googleAuthCubit;

  SheetCubit({required this.googleAuthCubit})
      : super(const SheetState.initial());

  Future<void> loadSheet(String fileId, String sheetTitle) async {
    emit(const SheetState.loading());
    final SheetsApi? sheetsApi = googleAuthCubit.state.when(
        (account, client, headers, sheetsApi) => sheetsApi,
        initial: (sheetsApi) => null,
        loading: (sheetsApi) => null);
    if (sheetsApi != null) {
      final Spreadsheet document = await sheetsApi.spreadsheets
          .get(fileId, includeGridData: true, ranges: [sheetTitle]);
      final Sheet sheet = document.sheets![0];
      //https://stackoverflow.com/questions/46466410/google-sheets-api-v4-for-flutter-dart
      //sheetsApi.spreadsheets.values.

      // sheetsApi.spreadsheets.values.update(
      //     ValueRange.fromJson(json.decode('{"values":[["val1","val2"]]}')),
      //     //sheet.properties!.sheetId.toString(),
      //     fileId,
      //     "A1:B1",
      //     valueInputOption: "USER_ENTERED"
      // );

      // sheetsApi.spreadsheets.values.update(
      //     ValueRange.fromJson(json.decode('{"values":[["val1","val2"]]}')),
      //     //sheet.properties!.sheetId.toString(),
      //     fileId,
      //     "R2C1:R2C2",
      //     valueInputOption: "USER_ENTERED"
      // );

      emit(SheetState(sheet: sheet));
    }
  }

  Future<void> updateRow(String fileId, String sheetTitle) async {
    final SheetsApi? sheetsApi = googleAuthCubit.state.when(
        (account, client, headers, sheetsApi) => sheetsApi,
        initial: (sheetsApi) => null,
        loading: (sheetsApi) => null);
    if (sheetsApi != null) {

    }
  }
}

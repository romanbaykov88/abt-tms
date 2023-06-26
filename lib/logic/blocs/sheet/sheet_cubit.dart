import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:tms/google_auth_client.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';

part 'sheet_state.dart';

part 'sheet_cubit.freezed.dart';

class SheetCubit extends Cubit<SheetState> {
  GoogleAuthCubit googleAuthCubit;

  SheetCubit({required this.googleAuthCubit})
      : super(const SheetState.initial());

  Future<void> loadSheet(String fileId, String sheetTitle) async {
    emit(const SheetState.loading());
    final Map<String, String>? headers = googleAuthCubit.state.when(
        (account, client, headers) => headers,
        initial: (client) => null,
        loading: (client) => null);
    if (headers != null) {
      final client = GoogleAuthClient(headers);
      final SheetsApi sheetsApi = SheetsApi(client);
      final Spreadsheet document = await sheetsApi.spreadsheets
          .get(fileId, includeGridData: true, ranges: [sheetTitle]);
      final Sheet sheet = document.sheets![0];
      emit(SheetState(sheet: sheet));
    }
  }
}

part of 'sheets_list_cubit.dart';

@freezed
class SheetsListState with _$SheetsListState {
  const factory SheetsListState.initial() = _Initial;

  const factory SheetsListState.loading() = _Loading;

  const factory SheetsListState.error() = _Error;

  const factory SheetsListState({
    required FileList fileList,
  }) = _SheetsListState;
}

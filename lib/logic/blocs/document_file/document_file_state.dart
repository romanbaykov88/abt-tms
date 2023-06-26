part of 'document_file_cubit.dart';

@freezed
class DocumentFileState with _$DocumentFileState {
  const factory DocumentFileState.initial() = _Initial;

  const factory DocumentFileState.loading() = _Loading;

  const factory DocumentFileState({
    Spreadsheet? document,
  }) = _DocumentFileState;
}

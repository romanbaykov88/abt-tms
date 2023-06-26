part of 'documents_list_cubit.dart';

@freezed
class DocumentsListState with _$DocumentsListState {
  const factory DocumentsListState.initial() = _Initial;

  const factory DocumentsListState.loading() = _Loading;

  const factory DocumentsListState.error() = _Error;

  const factory DocumentsListState({
    required FileList fileList,
  }) = _DocumentsListState;
}

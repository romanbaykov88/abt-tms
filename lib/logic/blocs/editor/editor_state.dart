part of 'editor_cubit.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState.initial() = _Initial;

  const factory EditorState({
    required String sheet,
  }) = _EditorState;
}

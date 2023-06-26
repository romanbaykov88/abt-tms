part of 'sheet_cubit.dart';

@freezed
class SheetState with _$SheetState {
  const factory SheetState.initial() = _Initial;

  const factory SheetState.loading() = _Loading;

  const factory SheetState({
    required Sheet? sheet,
  }) = _SheetState;
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'editor_state.dart';
part 'editor_cubit.freezed.dart';

class EditorCubit extends Cubit<EditorState> {
  EditorCubit() : super(const EditorState.initial());
}

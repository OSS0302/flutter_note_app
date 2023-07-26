import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_note_ui_event.freezed.dart';

@freezed
abstract class AddEditNoteUiEvent with _$AddEditNoteUiEvent { // 뷰모델에서 이벤트를 ui쪽으로 둘떄 사용하면된다.
  const factory AddEditNoteUiEvent.saveNote() = SaveNote;
}
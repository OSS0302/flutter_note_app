import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_note_event.freezed.dart';

@freezed
abstract class AddEditNoteEvent with _$AddEditNoteEvent {
  const factory AddEditNoteEvent.changeColor(int color) = ChangeColor; //색깔의 컬러 를 int로 db 에 저장하겠다.
  const factory AddEditNoteEvent.saveNote(int? id , String title, String content) =saveNote; // 원시타입으로 아이디가 널 있을수도 있어서 ? 넣고 제목 과 내용 String으로 한다.
}
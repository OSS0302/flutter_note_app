import 'package:flutter_note_app/domain/model/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_event.freezed.dart';
 // Euem class  아래의 기능을  선언해서 사용할수있지만 sealedclass 의 장점은 테이터를 받아서 사용할 수있다.
@freezed
abstract class NotesEvent<T> with _$NotesEvent{
  const factory NotesEvent.loadNotes() = LoadNotes; // 노트를 불러오는 기능  나중에 하나의 타입으로 만들것이다.
  const factory NotesEvent.deleteNote(Note note) = DeleteNote; // 노트를 삭제 하는 기능
  const factory NotesEvent.restoreNote() = RestroeNote; // 노트를 삭제 취소 기능

}
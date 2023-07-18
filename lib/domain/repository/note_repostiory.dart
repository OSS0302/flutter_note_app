import 'package:flutter_note_app/domain/model/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getNoes();

  // 클릭 하면 해당하는 메모페이지 로이동 을 아이디로 하겠다.
  Future<Note> getNoteById(int id);
  // 노트 추가
  Future<void> insertNote(Note note);
  // 노트 수정
  Future<void> updateNote(Note note);
  // 노트 삭제
  Future<void> deleteNoteNote(Note note);

}
import 'package:flutter_note_app/data/data_source/note_db.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository{
  NoteDbHelper db;// db 기능을 활용한 어떤 기능 하겠다.
  //생성자
  NoteRepositoryImpl(this.db);

  // 결과를 받아서 사용해야되므로  await 를  해야한다.
  // 메모 삭제
  @override
  Future<void> deleteNoteNote(Note note) async{
    await db.deleteNote(note);
  }
  // 아이디로 매모 데이터를 찾겠다 .
  @override
  Future<Note?> getNoteById(int id) async {
    return await db.getNoteById(id);
  }
  // 전체 노트 데이터 가져오기
  @override
  Future<List<Note>> getNoes() async {
    return await db.getNotes();
  }
  // 메모 작성 하기
  @override
  Future<void> insertNote(Note note) async {
   await db.insertNote(note);
  }
  // 메모 수정하기
  @override
  Future<void> updateNote(Note note) async {
  await db.update(note);
  }
}


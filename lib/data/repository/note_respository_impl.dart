import 'package:flutter_note_app/data/data_source/note_db.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repostiory.dart';

class NoteRepositoryImpl implements NoteRepository{
  NoteDb db;// db 기능을 활용한 어떤 기능 하겠다.
  //생성자
  NoteRepositoryImpl(this.db);

  // 결과를 받아서 사용해야되므로  await 를  해야한다.

  @override
  Future<void> deleteNoteNote(Note note) async{
    await db.deleteNote(note);
  }

  @override
  Future<Note?> getNoteById(int id) async {
    return await db.getNoteById(id);
  }
  @override
  Future<List<Note>> getNoes() async {
    return await db.getNotes();
  }

  @override
  Future<void> insertNote(Note note) async {
   await db.insertNote(note);
  }

  @override
  Future<void> updateNote(Note note) async {
  await db.update(note);
  }


}


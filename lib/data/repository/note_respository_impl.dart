import 'package:flutter_note_app/data/data_source/note_db.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repostiory.dart';

class NoteRepositoryImpl implements NoteRepository{
  NoteDb db;// db 기능을 활용한 어떤 기능 하겠다.
  //생성자
  NoteRepositoryImpl(this.db);

  @override
  Future<void> deleteNoteNote(Note note) {
    // TODO: implement deleteNoteNote
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNoes() {
    // TODO: implement getNoes
    throw UnimplementedError();
  }

  @override
  Future<Note> getNoteById(int id) {
    // TODO: implement getNoteById
    throw UnimplementedError();
  }

  @override
  Future<void> insertNote(Note note) {
    // TODO: implement insertNote
    throw UnimplementedError();
  }

  @override
  Future<void> updateNote(Note note) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
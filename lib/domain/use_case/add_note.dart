import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repostiory.dart';

class AddNote{
  // 메모를 추가하는 기능
  final NoteRepository  repository; // 노트를 조작하기위해서NoteRepository 가 필요하다

  AddNote(this.repository); // 생성자로 받아 준다.
  Future<void> call(Note note) async{
    await repository.insertNote(note);
  }
}
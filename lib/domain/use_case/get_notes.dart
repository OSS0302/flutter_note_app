import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';

// 모든 노트를 불러오는 기능
class GetNotes {
  final NoteRepository repository; // NoteRepository를 활용해야되서

  GetNotes(this.repository);// 생성자를 받아서 사용을 합니다.

  Future<List<Note>> call() async{
    List<Note> notes = await repository.getNoes();
    return notes;

  }
}
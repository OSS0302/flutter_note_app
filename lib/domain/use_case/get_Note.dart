import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';

class GetNote{
  final NoteRepository repository;

  GetNote(this.repository);

  Future<Note?> call(int id) async{
    return await repository.getNoteById(id); // 입출력 아이디 가 동일하기 때문이다.
  }
}

import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repostiory.dart';

class DeleteNote{// 메모를 삭제하는 기능
   final NoteRepository repository;//

   DeleteNote(this.repository); //note 를 사용하려면 NoteRepository가 필요하다

  Future<void> call(Note note) async{
    await repository.deleteNoteNote(note); // deleteNoteNote를 repository로 전달만 하면 된다.

  }
}



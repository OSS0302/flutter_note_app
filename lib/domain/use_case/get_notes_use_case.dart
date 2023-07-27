import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';

// 모든 노트를 불러오는 기능
class GetNotesUseCase {
  final NoteRepository repository; // NoteRepository를 활용해야되서

  GetNotesUseCase(this.repository);// 생성자를 받아서 사용을 합니다.

  Future<List<Note>> call() async{
    List<Note> notes = await repository.getNoes();
    //정렬하기 timestreamp 기준으로 a 와 b 를 비교하겠다. 기준으로 오름 차순 정렬이 된다.
    notes.sort((a,b)=> -a.timestamp.compareTo(b.timestamp));// 반대로 하기위해서 -a를 쓴다.
    return notes;

  }
}
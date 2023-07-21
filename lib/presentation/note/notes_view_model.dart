import 'package:flutter/cupertino.dart';
import 'package:flutter_note_app/domain/repository/note_repostiory.dart';

class NotesViewModel with ChangeNotifier {
  // noteRepository 경우해서 일반적으로 MVVM 사용하듯이 하겠다.
  final  NoteRepository noteRepository;

  NotesViewModel(this.noteRepository); //NotesViewModel 이  noteRepository 받아서 활용 하겠다.

  // 첫번쨰 화면 할 수있는 기능을 지우기와 undo 모든 노트 가져오기 세가지  첫번째 화면에서 필요하다
   // view Model 메소드로 만들어 놓고
}

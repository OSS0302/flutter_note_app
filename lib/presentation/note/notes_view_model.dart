import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/use_case/add_note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/delete_note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/get_notes_use_case.dart';
import 'package:flutter_note_app/domain/use_case/use_cases.dart';
import 'package:flutter_note_app/presentation/note/notes_event.dart';
import 'package:flutter_note_app/presentation/note/notes_state.dart';

class NotesViewModel with ChangeNotifier {
  final UseCases useCases;

  NotesState _state = NotesState(notes: []);

  NotesState get state => _state; //  이제 state 에서 관리하니까  아래 주석 한 로직 은 지워도 된다.

  Note? _recentlyDeleteNote; // 최근에 삭제된 메모 데이터를 여기다가 넣을것이다.

  NotesViewModel(
      this.useCases,) {
    //NotesViewModel 이  noteRepository 받아서 활용 하겠다.
    _loadNotes(); // 뷰모델에서  _loadNotes 실행
  }

  // 첫번쨰 화면 할 수있는 기능을 지우기와 undo 모든 노트 가져오기 세가지  첫번째 화면에서 필요하다
  // view Model 메소드로 만들어 놓고

  void onEvent(NotesEvent event) {
    // 만들었던 notes_event 기능을 받아서  여기다가  사용하겠다.
    event.when(
      loadNotes: _loadNotes, // _loadNotes 연결하기
      deleteNote: _deleteNote, // deleteNote 연결하기
      restoreNote: _restoreNote, // Undo 연결하기
    ); //세가지 기능
  }

  // 모든 노트 데이터 가져오기
  Future<void> _loadNotes() async {
    // 다른곳에 사용못하도록 _loadNotes 언더바를 사용했다.
    List<Note> notes = await useCases.getNotesUseCase(); // 모든 노트 데이터 가져오기 getNotes뒤에 call 함수는 굳이 안써도 된다.
    _state = state.copyWith(
      notes: notes, // 노트 를 갱신 하겠다.
    ); // notes 교체하기
    notifyListeners(); // 이벤트 가 있다면 수행해라
  }

  // 삭제기능
  Future<void> _deleteNote(Note note) async {
    await useCases.deleteNoteUseCase(note); // 노트를 삭제하기
    _recentlyDeleteNote = note;
    await _loadNotes
    (
    ); // 다시 모든 노트 데이터를 가져오기
  }

  // Undo 삭제 했을 때 되돌리기
  Future<void> _restoreNote() async {
    // Undo 는 형태만 만들고 나중에 로직 만든후에 하겠다.
    if (_recentlyDeleteNote != null) { // _recentlyDeleteNote null 이 아니라면
      await useCases.addNoteUseCase(_recentlyDeleteNote!); //
      _recentlyDeleteNote = null; // _recentlyDeleteNote를 다시 비워 준다.

      _loadNotes(); // 다시 로드를 하자
    }
  }
}

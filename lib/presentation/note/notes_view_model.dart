import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/presentation/note/notes_event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
class NotesViewModel with ChangeNotifier {
  // noteRepository 경우해서 일반적으로 MVVM 사용하듯이 하겠다.
 final NoteRepository repository;



  // 모든 노트데이터 를 저장할 빈리스트 생성
  List<Note> _notes = [];
   UnmodifiableListView<Note> get notes=> UnmodifiableListView( _notes); // 상태가 여러개인 경우에는 상태를 하나로 모으는게 좋다.

    Note? _recentlyDeleteNote ; // 최근에 삭제된 메모 데이터를 여기다가 넣을것이다.

    NotesViewModel(this.repository); //NotesViewModel 이  noteRepository 받아서 활용 하겠다.


  // 첫번쨰 화면 할 수있는 기능을 지우기와 undo 모든 노트 가져오기 세가지  첫번째 화면에서 필요하다
  // view Model 메소드로 만들어 놓고

  void onEvent(NotesEvent event) {
    // 만들었던 notes_event 기능을 받아서  여기다가  사용하겠다.
    event.when(
      loadNotes: _loadNotes , // _loadNotes 연결하기
      deleteNote: deleteNote, // deleteNote 연결하기
      restoreNote: _restoreNote, // Undo 연결하기
    ); //세가지 기능
  }

  // 모든 노트 데이터 가져오기
  Future<void> _loadNotes() async{ // 다른곳에 사용못하도록 _loadNotes 언더바를 사용했다.
    List<Note> notes = await repository.getNoes(); // 모든 노트 데이터 가져오기
  _notes = notes;  // notes 교체하기
    notifyListeners(); // 이벤트 가 있다면 수행해라
  }
  // 삭제기능
  Future<void>deleteNote(Note note)async {
    await repository.deleteNoteNote(note); // 노트를 삭제하기
    _recentlyDeleteNote = note;
    await _loadNotes(); // 다시 모든 노트 데이터를 가져오기
  }
  Future<void>_restoreNote() async{ // Undo 는 형태만 만들고 나중에 로직 만든후에 하겠다.
    if(_recentlyDeleteNote!=null){ // _recentlyDeleteNote null 이 아니라면
      await repository.insertNote(_recentlyDeleteNote!); //
      _recentlyDeleteNote = null; // _recentlyDeleteNote를 다시 비워 준다.

      _loadNotes(); // 다시 로드를 하자
    }
  }
}

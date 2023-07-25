import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:flutter_note_app/ui/colors.dart';

class AddEditNoteViewModel with ChangeNotifier {
  NoteRepository repository;

  int _color = roseBud.value;

  int get color => _color; // 밖에서 색깔를 변경해서 전달하면

  AddEditNoteViewModel(this.repository);

  void onEvent(AddEditNoteEvent event) {
    event.when(changeColor: _changeColor, saveNote: _saveNote);
  }

  // 메모 색깔 변경하는 기능
  Future<void> _changeColor(int color) async {
    _color = color; // 컬러를 변경하고
    notifyListeners(); // 이벤트 감지 하면된다.
  }

  // 아이디 제목 내용 저장하는 기능
  Future<void> _saveNote(int? id, String title, String content) async {
    if (id == null) {
      await repository.insertNote(Note( // 작성할 때 저장
          title: title, // 제목
          content: content, // 내용
          color: _color,  // 색깔
          timestamp: DateTime.now().microsecondsSinceEpoch), // 현재시간을 밀리 초 데이터를 가져온다.
       );
    } else {
      await repository.updateNote( // 수정 할때 저장
      Note(
        id: id, // 아이디
        title: title, // 제목
        content: content, // 내용
        color: _color,  // 색깔
        timestamp: DateTime.now().microsecondsSinceEpoch), // 현재시간을 밀리 초 데이터를 가져온다.
      );
    }
  }
}

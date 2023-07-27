import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/util/note_order.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_state.freezed.dart';


@freezed
class NotesState with _$NotesState {
  factory NotesState({
   required List<Note> notes, // List<Note> notes =[] 를 줄 수없어서 @Default를 사용해서 넣었다.
   required NoteOrder noteOrder, //NoteOrder 를 추가해주고 나서
  }) = _NotesState;

}
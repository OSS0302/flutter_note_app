import 'package:flutter_note_app/domain/model/note.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_state.freezed.dart';

part 'notes_state.g.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
   required List<Note> notes, // List<Note> notes =[] 를 줄 수없어서 @Default를 사용해서 넣었다.
  }) = _NotesState;

  factory NotesState.fromJson(Map<String, dynamic> json) => _$NotesStateFromJson(json);
}
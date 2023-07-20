
  // freezed 통해서  쉽게 만들겠다.
  import 'package:freezed_annotation/freezed_annotation.dart';
  import 'package:json_annotation/json_annotation.dart';

  part 'note.freezed.dart';

  part 'note.g.dart';

  @freezed
  class Note with _$Note {
    factory Note({
   required String title,// 노트 제목
   required String content,// 내용
   required int color, // 노트 컬러
   required int timestamp, // 시간 있어야  최근에 올린 노트를 확인이 가능하다.
    int? id, //  데이터 베이스 값을 활용하기 위해서 아이디 가 필요하다.
    }) = _Note;

    factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  }
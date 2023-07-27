import 'package:flutter_note_app/domain/use_case/add_note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/delete_note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/get_Note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/get_notes_use_case.dart';
import 'package:flutter_note_app/domain/use_case/update_note_use_case.dart';

class UseCases {
  final AddNoteUseCase addNoteUseCase; // 메모 작성 하는 유스케이스
  final DeleteNoteUseCase deleteNoteUseCase; // 메모 삭제 하는 유스케이스
  final UpdateNoteUseCase updateNoteUseCase; // 메모 수정 하는 유스케이스
  final GetNoteUseCase getNoteUseCase; // 해당하는 메모 불러오는 유스케이스
  final GetNotesUseCase getNotesUseCase; //모든 메모 불러오는 유스케이스

  // 생성자 추가 옵션줫 사용하기
  UseCases({
    required this.addNoteUseCase,
    required this.deleteNoteUseCase,
    required this.updateNoteUseCase,
    required this.getNoteUseCase,
    required this.getNotesUseCase,
  });
}

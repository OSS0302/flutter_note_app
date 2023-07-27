import 'package:flutter_note_app/data/data_source/note_db.dart';
import 'package:flutter_note_app/data/repository/note_respository_impl.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/domain/use_case/add_note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/delete_note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/get_Note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/get_notes_use_case.dart';
import 'package:flutter_note_app/domain/use_case/update_note_use_case.dart';
import 'package:flutter_note_app/domain/use_case/use_cases.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:flutter_note_app/presentation/note/notes_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

Future<List<SingleChildWidget>> getProvider() async {
  Database database = await openDatabase(
      'notes_db', // path: notes_db  파일이름 작성
      version: 1, // 버전은 1로
      onCreate: (db, version) async { // db를 비동기로 연다.
        await db.execute
          (
            'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT , color INTEGER , timestamp, INTEGER)');
      }
  );
  // 객체를 만들어서 전달만 하면된다
  NoteDbHelper noteDbHelper = NoteDbHelper(database);
  NoteRepository repository = NoteRepositoryImpl(noteDbHelper);
  UseCases useCases = UseCases(
    addNoteUseCase: AddNoteUseCase(repository),
    deleteNoteUseCase: DeleteNoteUseCase(repository),
    updateNoteUseCase: UpdateNoteUseCase(repository),
    getNoteUseCase: GetNoteUseCase(repository),
    getNotesUseCase: GetNotesUseCase(repository),);

  NotesViewModel notesViewModel = NotesViewModel(useCases); // viewMdoel
  AddEditNoteViewModel addEditNoteViewModel = AddEditNoteViewModel(repository);

  return [ // ChangeNotifier를 통해 변화에 대해 구독할 수 있다.
    ChangeNotifierProvider(create: (_) => notesViewModel),
    ChangeNotifierProvider(create: (_) => addEditNoteViewModel),
  ];
}

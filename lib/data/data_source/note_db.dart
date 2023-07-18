import 'package:flutter_note_app/domain/model/note.dart';
import 'package:sqflite/sqlite_api.dart';

class NoteDb {
  // 실제 데이터를 구성하는 db
  Database db; // db 를 받고

  NoteDb(this.db); // 생성자 추가

  Future<Note?> getNoteById(int id) async {
    // Select * from note where id = 1;
    final List<Map<String ,dynamic>> maps = await db.query( // Json타입을 String ,dynamic 하겠다.
      'note',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty){ // maps 에 데이터 가 있다면
      return Note.fromJson(maps.first); // 데이터 가 하나만 들어있기 때문에  maps 를 노트로변환해서 리턴한다.
    }
    return null; // 데이터 없으면 null 로 반환한다.
  }
  // 전체 노트 가져오기
}
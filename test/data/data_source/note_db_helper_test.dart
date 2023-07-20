import 'package:flutter_note_app/data/data_source/note_db_helper.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main(){
  test('db test', () async{
    final db =await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);// 임시로 db에 작성 할 수있다.

    // 테이블 생성하기
    await db.execute
      ('CREATE TABLE note(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT , color INTEGER , timestamp, INTEGER)');  // create 기능이 없어서 execute 로 작성한다.

    final noteDbHelper = NoteDbHelper(db); // 데이터 베이스 객체를 전달해서 생성한다.
    // 메모 작성하기
    await noteDbHelper.insertNote(Note(
        title: 'test',
        content: 'test',
        color: 1,
        timestamp: 1,
    ));
    // 잘 들어갔는지 확인 로직
     expect((await noteDbHelper.getNotes()).length, 1); // 한개 메모있는지 확인 하는 로직

    Note note = (await noteDbHelper.getNoteById(1))!; // 위에 있어서 Nullable !를 사용한다.
    expect(note.id, 1); // 노트 아이디 1인지 확인

    // 수정
    //note.title ='change';// freezed 불변객체 여서 그냥  바꿀수없고 freezed 는 copywith를 통해서  변경할 수있다.
    await noteDbHelper.update(note.copyWith(
      title: 'change'
    ));
    // 변경된 제목 확인하기
    note = (await noteDbHelper.getNoteById(1))!;
    expect(note.title, 'change');

    // 메모 삭제
    await noteDbHelper.deleteNote(note);
    expect((await noteDbHelper.getNotes()).length ,0);

    db.close(); // db 닫기
  });
}

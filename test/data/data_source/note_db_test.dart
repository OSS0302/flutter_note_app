import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main(){
  test('db test', () async{
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath); // 임시로 db에 작성 할 수있다.

    // 테이블 생성하기
    await db.execute('CREATE TABLE note (id INTEGER PRIMARY KEY  AUTOINCREMENT, title TEXT, content TEXT,color INTEGER, timestamp INTEGER)');  // create 기능이 없어서 execute 로 작성한다.
  });
}

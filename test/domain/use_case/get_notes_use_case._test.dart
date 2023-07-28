import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/domain/use_case/get_notes_use_case.dart';
import 'package:flutter_note_app/domain/util/note_order.dart';
import 'package:flutter_note_app/domain/util/order_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_notes_use_case._test.mocks.dart';
@GenerateMocks([NoteRepository]) // 가짜 데이터  만들 노트레포지토리 입력한다.
void main(){
  test('정렬 기능이 잘 동작 해야 한다.',() async{ // 가짜 데이터가 필요하다
    // mockito 를 사용한다.
    final repository= MockNoteRepository();
    final getNotes = GetNotesUseCase(repository);
      // 동작 정의
    when(repository.getNoes()).thenAnswer((_) async => [ // 가짜 데이터 넣기
      Note(title: 'title', content: 'content', color: 1, timestamp:  0),
      Note(title: 'title2', content: 'content2', color: 2, timestamp:  2),
    ]);
    // 날짜 기준으로 마지막 메모를 맨 위로 올리겠다.
    List<Note> result  = await getNotes(const NoteOrder.date(OrderType.descending()));

    //타임리프 테스트
    expect(result, isA<List<Note>>()); //타임스템프에 2인지 확인하는 테스트
    expect(result.first.timestamp,2 );//타임스템프에 2인지 확인하는 테스트
    result  = await getNotes(const NoteOrder.date(OrderType.ascending()));
    expect(result.first.timestamp,0 );//타임스템프에 0인지 확인하는 테스트 내림차순
    verify(repository.getNoes()); // repository.getNoes()를 통해서 테스트를 했는지 검증하는 로직

    // 제목 테스트
    result  = await getNotes(const NoteOrder.title(OrderType.ascending()));//오름차순 제목으로
    expect(result.first.title,'title' );//제목 테스트하기
    verify(repository.getNoes()); // repository.getNoes()를 통해서 테스트를 했는지 검증하는 로직
    result  = await getNotes(const NoteOrder.title(OrderType.descending()));//내림차순 제목으로
    expect(result.first.title,'title2' );//제목 테스트하기
    verify(repository.getNoes()); // repository.getNoes()를 통해서 테스트를 했는지 검증하는 로직

    // 컬러 테스트
    result  = await getNotes(const NoteOrder.color(OrderType.ascending()));//오름차순 제목으로
    expect(result.first.color,1 );//제목 테스트하기
    verify(repository.getNoes()); // repository.getNoes()를 통해서 테스트를 했는지 검증하는 로직
    result  = await getNotes(const NoteOrder.color(OrderType.descending()));//내림차순 제목으로
    expect(result.first.color,2 );//제목 테스트하기
    verify(repository.getNoes()); // repository.getNoes()를 통해서 테스트를 했는지 검증하는 로직
    verifyNoMoreInteractions(repository); //더이상 활용해서 테스트한게 있느냐 한게 있느냐

  });
}
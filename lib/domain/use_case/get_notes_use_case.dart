import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/domain/util/note_order.dart';
// enum를 통해서 정렬 기준을 할 수있다.

// 모든 노트를 불러오는 기능
class GetNotesUseCase {
  final NoteRepository repository; // NoteRepository를 활용해야되서

  GetNotesUseCase(this.repository); // 생성자를 받아서 사용을 합니다.

  Future<List<Note>> call(NoteOrder noteOrder) async {
    List<Note> notes = await repository.getNoes(); // 받아서 사용
    //noteOrder when 사용한다.
    noteOrder.when(
      title: (orderType) {
        orderType.when(
          ascending: () {
            notes.sort((a, b) => a.title.compareTo(b.title)); // 정상작동하기위해서
          },
          descending: () { //내람차순
            //정렬하기 timestreamp 기준으로 a 와 b 를 비교하겠다. 기준으로 오름 차순 정렬이 된다.
            notes.sort((a, b) => -a.title.compareTo(b.title)); // 반대로 하기위해서 -a를 쓴다.
          },
        );
      },
      date: (orderType) {
        orderType.when(
          ascending: () {
            notes.sort((a, b) => a.timestamp.compareTo(b.timestamp)); // 정상작동하기위해서
          },
          descending: () { //내람차순
            //정렬하기 timestreamp 기준으로 a 와 b 를 비교하겠다. 기준으로 오름 차순 정렬이 된다.
            notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp)); // 반대로 하기위해서 -a를 쓴다.
          },
        );
      },
      color: (orderType) {
        orderType.when(
          ascending: () {
            notes.sort((a, b) => a.color.compareTo(b.color)); // 정상작동하기위해서
          },
          descending: () { //내람차순
            //정렬하기 timestreamp 기준으로 a 와 b 를 비교하겠다. 기준으로 오름 차순 정렬이 된다.
            notes.sort((a, b) => -a.color.compareTo(b.color)); // 반대로 하기위해서 -a를 쓴다.
          },
        );
      },
    );
    return notes;
  }
}

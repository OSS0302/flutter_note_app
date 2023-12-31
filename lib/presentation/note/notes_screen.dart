import 'package:flutter/material.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:flutter_note_app/presentation/note/components/note_item.dart';
import 'package:flutter_note_app/presentation/note/components/order_section.dart';
import 'package:flutter_note_app/presentation/note/notes_event.dart';
import 'package:flutter_note_app/presentation/note/notes_view_model.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>(); // 뷰모델를 받고나서
    final state = viewModel.state; // state을 받는다.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '나의 노트',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.onEvent(const NotesEvent.toggleOrderSection());
            },
            icon: const Icon(Icons.sort), // appbar 상단에 솔트 버튼 추가
          )
        ],
        elevation: 0, // elevation을 0 으로 두면 appbar 도 다크 그레이 가된다.
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isSaved = await Navigator.push(
            //null 이면 사용자가 뒤로가기 한거고 true 값이 들어오면 saveNote 동작해서 되돌아온거다.
            context,
            MaterialPageRoute(
                builder: (context) =>
                const AddEditNoteScreen()), // 첫번째화면에서 두번째화면으로 이동
          );
          if (isSaved != null && isSaved) {
            // isSaved 널이 아니라면 새로고침 해라
            viewModel.onEvent(const NotesEvent.loadNotes()); //loadNotes: 새로고침
          }
        },
        child: const Icon(Icons.add),
      ),
      // container 안에 리스트를 통해서 모든 노트 가져오기
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: state.isOrderSectionVisible
                ? OrderSection(
              noteOrder: state.noteOrder, // noteOrder state있는 noteOrder 를 주면된다.
              onOrderChanged: (noteOrder) {
                viewModel.onEvent(NotesEvent.changeOrder(
                    noteOrder)); // onEvent에 체인지 오더로 전달하면된다.
              },
            ): Container(),
          ),
          ...state.notes
              .map(
                (note) =>
                GestureDetector(
                  onTap: () async {
                    bool? isSaved = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AddEditNoteScreen(
                              note: note,
                            ),
                      ),
                    );
                    if (isSaved != null && isSaved) {
                      // isSaved 널이 아니라면 새로고침 해라
                      viewModel.onEvent(
                          const NotesEvent.loadNotes()); //loadNotes: 새로고침
                    }
                  },
                  child: NoteItem(
                    note: note,
                    onDeleteTap: () {
                      viewModel.onEvent(
                          NotesEvent.deleteNote(note)); // 이벤트를 전달해서 삭제 한다.
                      //undo
                      final snackBar = SnackBar(
                        content: const Text('노트가 삭제가되었습니다.'),
                        action: SnackBarAction(
                          label: '취소',
                          onPressed: () {
                            viewModel.onEvent(const NotesEvent.restoreNote());
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                ),
          )
              .toList(),
        ]),
      ),
    );
  }
}

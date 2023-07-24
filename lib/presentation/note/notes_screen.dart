import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/presentation/note/components/note_item.dart';
import 'package:flutter_note_app/ui/colors.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '나의 노트',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort), // appbar 상단에 솔트 버튼 추가
          )
        ],
        elevation: 0, // elevation을 0 으로 두면 appbar 도 다크 그레이 가된다.
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      // container 안에 리스트를 통해서 모든 노트 가져오기
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            NoteItem(
                note: Note(
                    title: 'title 1',
                    content: 'content 1',
                    color: wisteria .value,
                    timestamp: 1
                )
            ),
            NoteItem(
                note: Note(
                    title: 'title 2',
                    content: 'content 2',
                    color: skyBlue .value,
                    timestamp: 2
                )
            ),
          ],
        ),
      ),
    );
  }
}

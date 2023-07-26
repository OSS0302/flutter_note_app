import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/model/note.dart';

class NoteItem extends StatelessWidget {
  final Note note; //노트를 받아서 생성자를 통해서

  final Function? onDeleteTap; // 쓰레기 버튼을 눌렸을 떄 작동하기 위해서 생성

   NoteItem({
    Key? key,
    required this.note,
    this.onDeleteTap,
  }) : super(key: key); // 노트 생성자 추가 required 필요

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Container의 전체를 패딩으로 감싸기
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16), // 노트 1 과 노트 2 간격 주기
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), // 박스 테코 테두리에 10 정도 둥글게
              color: Color(note.color), //컬러를 노트 컬러로
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // 세로 정렬 시작 하는데 부터 하겠다.
              children: [
                Text(
                  note.title,
                  maxLines: 1, // 제목 한줄 보여주기
                  overflow: TextOverflow.ellipsis, // 길면 뒤에... 으로 나온다.
                  style: Theme.of(context).textTheme.headline6,
                ), // 제목
                const SizedBox(height: 8), // 제목 과 내용 SizedBox 로 간격주기
                Text(
                  note.content,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis, // 길면 뒤에... 으로 나온다.
                  style: Theme.of(context).textTheme.bodyText2,
                ), // 내용
              ],
            ),
          ),
          Positioned(
            right: 8, // 오른쪽으로 8
            bottom: 8, // 밑에 8
            child: GestureDetector(
              onTap: () {
                onDeleteTap?.call();// call() 생략이 가능하다
              },
                child: const Icon(Icons.delete),
            ), // 휴지통 아이콘
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_note_app/ui/colors.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final  _titleController = TextEditingController(); // 제목 컨트롤러
  final  _contentController = TextEditingController(); // 내용컨트롤러


  final List<Color> noteColor= [ // 컬러 ui에서 만든 5가지 컬러 리스트
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //버튼 누르면 저장하는 버튼 추가히기
      floatingActionButton: FloatingActionButton(onPressed: () { },
      child: const Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: skyBlue,
          child: Column(
            children: [
              Row(
                children: [

                ],
              ),
              // 제목
              TextField(
                maxLines: 1 ,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: darkGary,
                ),
                decoration: const InputDecoration(
                  hintText: '제목을 입력하세요', //
                  border: InputBorder.none, // 밑줄 제거
                ),
             ),
              // 내용
              TextField(
                maxLines: null,// null 하면 아래로 내려간다.
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: darkGary,
                ),
                decoration: const InputDecoration(
                  hintText: '내용을 입력하세요',
                  border: InputBorder.none, // 밑줄 제거
                ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}

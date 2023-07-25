import 'package:flutter/material.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:flutter_note_app/ui/colors.dart';
import 'package:provider/provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController(); // 제목 컨트롤러
  final _contentController = TextEditingController(); // 내용컨트롤러

  @override //메모리애서 헤제 해야한다.
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
  }

  final List<Color> noteColor = [
    // 컬러 ui에서 만든 5가지 컬러 리스트
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion,
  ];

  @override
  Widget build(BuildContext context) {
    final  viewModel = context.watch<AddEditNoteViewModel>();
    return Scaffold(
      //버튼 누르면 저장하는 버튼 추가히기
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(_titleController.text.isNotEmpty || _contentController.text.isNotEmpty){
            const snackBar = SnackBar( content: Text('제목이나 내용이 비어있습니다.',));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

          }
        },
        child: const Icon(Icons.save),
      ),
      body: AnimatedContainer(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
          top: 48,
        ), //  5가지 컬러 패딩에서 간견주기
          color: Color(viewModel.color), // 컬러를 뷰모델 컬러로 깜사서 연결해준다.
          duration: const Duration(milliseconds: 500) ,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // 동일하게 간격두기
                children: noteColor
                    .map(
                      (color) => InkWell(
                          onTap: () {
                           viewModel.onEvent(AddEditNoteEvent.changeColor(color.value)); // on Event를 통해서 이벤트를 전달하고 .value 는 타입이 서로 맞지 않아서 맞춘다.
                          },
                          child: _buildBackgroundColor(
                            color: color,
                            selected: viewModel.color == color.value,// .value 는 타입이 서로 맞지 않아서 맞춘다.
                          ),
                      ),
                    )
                    .toList(), // 리스트로 변환한  컬러 5가지 컬러 받겠다.
              ),
              // 제목
              TextField(
                controller: _titleController, // 제목 컨트롤러 연결
                maxLines: 1,
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
                controller: _contentController, //내용 컨트롤러 연결
                maxLines: null, // null 하면 아래로 내려간다.
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
    );
  }

  Widget _buildBackgroundColor({
      required Color color,
      required bool selected})  {
    // bool Selected 하면 원에 검은색 테두리  가 나온다.
    return Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: color, // 컬러 5가지 선택 받고
          shape: BoxShape.circle, // 모양을 원으로
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // 불투명하게 0.2
              blurRadius: 5.0, //그림자 효과를 흐리게 해줌, 0일 수록 그림자 선이 선명해짐
              spreadRadius: 1.0, //그림자 효과의 반경, 설정 값이 높을 수록 넓어진다.
            ),
          ],
          border: selected
              ? Border.all(
                  // selected 가 true 면 테두리 검은색 으로 나오고 아니면 널로 수행해랴
                  color: Colors.black,
                  width: 3.0,
                )
              : null,
        ));
  }
}

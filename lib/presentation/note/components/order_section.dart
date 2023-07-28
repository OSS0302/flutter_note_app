import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/util/note_order.dart';
import 'package:flutter_note_app/domain/util/order_type.dart';

class OrderSection extends StatelessWidget {
  final NoteOrder noteOrder; // NoteOrder 를 받고 나서

  final Function(NoteOrder noteOrder) onOrderChanged; // NoteOrder를 타입으로 리턴하고

  const OrderSection({
    // noteOrder,onOrderChanged 생성자 추가하고
    Key? key,
    required this.noteOrder,
    required this.onOrderChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio<NoteOrder>(
              // Radio: 제네릭으로 정의해야한다.
              value: NoteOrder.title(noteOrder.orderType),
              // NoteOrder.title에 noteOrder.orderType를 넣어주면 된다.
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.title(noteOrder
                    .orderType)); //onOrderChanged 클릭하면 NoteOrder 전달해서 타이틀에 NoteOrder에 orderType 를 넘겼다.
              },
              activeColor: Colors.white, // 버튼 눌렀을 때 컬러 를 흰색으로
            ),
            const Text(' 제목'),
            Radio<NoteOrder>(
              // Radio: 제네릭으로 정의해야한다.
              value: NoteOrder.date(noteOrder.orderType),
              // NoteOrder.date noteOrder.orderType를 넣어주면 된다.
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.date(noteOrder
                    .orderType)); //onOrderChanged 클릭하면 NoteOrder 전달해서 타이틀에 NoteOrder에 orderType 를 넘겼다.
              },
              activeColor: Colors.white, // 버튼 눌렀을 때 컬러 를 흰색으로
            ),
            const Text('날짜 '),
            Radio<NoteOrder>(
              // Radio: 제네릭으로 정의해야한다.
              value: NoteOrder.color(noteOrder.orderType),
              // NoteOrder.color noteOrder.orderType를 넣어주면 된다.
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.color(noteOrder
                    .orderType)); //onOrderChanged 클릭하면 NoteOrder 전달해서 타이틀에 NoteOrder에 orderType 를 넘겼다.
              },
              activeColor: Colors.white, // 버튼 눌렀을 때 컬러 를 흰색으로
            ),
            const Text('색상'),
          ],
        ),
        Container(
          height: 18,
          child: Row(
            children: [
              Radio<OrderType>(
                // Radio: 제네릭으로 정의해야한다.
                value: const OrderType.ascending(),
                groupValue: noteOrder.orderType,
                onChanged: (OrderType? value) {
                  onOrderChanged(noteOrder.copyWith(
                    orderType: const OrderType.ascending(),  //orderType에서 현재있는 값에서 OrderType.ascending 만 바꾼다.
                  ));
                },
                activeColor: Colors.white, // 버튼 눌렀을 때 컬러 를 흰색으로
              ),
              const Text('오름차순'),
              Radio<OrderType>(
                // Radio: 제네릭으로 정의해야한다.
                value: const OrderType.descending(),
                groupValue: noteOrder.orderType,
                onChanged: (OrderType? value) {
                  onOrderChanged(noteOrder.copyWith(
                    orderType: const OrderType.descending(),  //orderType에서 현재있는 값에서 OrderType.ascending 만 바꾼다.
                  ));
                },
                activeColor: Colors.white, // 버튼 눌렀을 때 컬러 를 흰색으로
              ),
              const Text('내림차순 '),

            ],
          ),
        ),
      ],
    );
  }
}

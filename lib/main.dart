import 'package:flutter/material.dart';
import 'package:flutter_note_app/di/provider_setup.dart';
import 'package:flutter_note_app/presentation/note/notes_screen.dart';
import 'package:flutter_note_app/ui/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //db 가 네이티브 내부에서 사용하면서 플랫폼 바인딩을 보장한다.
  final providers = await getProvider(); //프로바이더를 가져오고


  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        unselectedWidgetColor: Colors.white, // 라디오 버튼 흰색으로 보이게 하기 (누르기전)
        primaryColor: Colors.white,
        scaffoldBackgroundColor: darkGary,
        canvasColor: darkGary,
        floatingActionButtonTheme:
            Theme.of(context).floatingActionButtonTheme.copyWith(
                  backgroundColor: Colors.white, // 추가버튼를 흰색
                  foregroundColor: darkGary, // + 버튼 색 다크 그래이로 변경
                ),
        // appbar 테마 설정
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              backgroundColor: darkGary,
            ),
        textTheme: Theme.of(context).textTheme.apply(// 속성를 정의할 수있는 apply
          // textTheme 안에 있는 세부적인 속성를  정의 할수있다.
          bodyColor: Colors.white // 타이틀 흰색
        ),
      ),
      home: const NotesScreen(),
    );
  }
}

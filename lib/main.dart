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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
      ),
      home: const NotesScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_note_app/presentation/note/notes_screen.dart';
import 'package:flutter_note_app/ui/colors.dart';

void main() {
  runApp(const MyApp());
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
      ),
      home: NotesScreen(),
    );
  }
}


// main.dart
import 'package:flutter/material.dart';
import 'chapter_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'भगवद गीता',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ChapterListScreen(),
    );
  }
}
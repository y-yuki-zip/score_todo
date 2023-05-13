import 'package:flutter/material.dart';
import 'todo_group.dart' ;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'Score ToDo List',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),
      // リスト一覧
      home: const TodoGroup(),
    );
  }
}